package com.guideyou.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.product.ProductDetailDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.dto.product.ProductPhotoDto;
import com.guideyou.dto.product.ProductReviewDto;
import com.guideyou.dto.product.ProductThumbnailDto;
import com.guideyou.dto.product.UploadProductsInfoDTO;
import com.guideyou.repository.entity.Product;
import com.guideyou.repository.entity.ProductPhotos;
import com.guideyou.repository.interfaces.product.ProductPhotosRepository;
import com.guideyou.repository.interfaces.product.ProductRepository;
import com.guideyou.utils.Define;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductPhotosRepository photosRepository;

	/**
	 * @Method Name : createProduct
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 등록 로직
	 */
	@Transactional
	public int createProduct(ProductDto dto) {
		// Product 저장
		Product product = Product.builder().userId(dto.getUserId()).cityCodeId(dto.getCityCodeId())
				.title(dto.getTitle()).price(dto.getPrice()).introContent(dto.getIntroContent())
				.content(dto.getContent()).build();

		productRepository.insert(product);
		int productId = product.getId();

		String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
		// 폴더가 없다면 오류 발생(파일 생성시)
		String savePath = saveDirectory.split("\\\\")[0] + "\\\\" + saveDirectory.split("\\\\")[1];

		File dir = new File(savePath);
		if (!dir.exists()) {
			dir.mkdir(); // 폴더가 없으면 폴더 생성
		}

		File dir2 = new File(saveDirectory);
		if (!dir2.exists()) {
			dir2.mkdir(); // 폴더가 없으면 폴더 생성
		}

		// 썸네일 파일 저장 로직
		MultipartFile thumbFile = dto.getThumbFile();
		String thumbfilename = thumbFile.getOriginalFilename();
		String thumbpath = Define.UPLOAD_FILE_DERECTORY;
		String thumbext = StringUtils.getFilenameExtension(thumbfilename);

		LocalDateTime now = LocalDateTime.now();
		String thumbUploadFileName = "thumbnail_" + "P" + now.getYear() + now.getMonthValue() + now.getDayOfMonth()
				+ now.getHour() + now.getMinute() + now.getSecond() + (int) (Math.random() * 100) + "." + thumbext;

		try {
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream(new File(thumbpath + "/" + thumbUploadFileName)));
			bos.write(thumbFile.getBytes());
			bos.close();

			ProductPhotos photos = new ProductPhotos();
			photos.setProductId(productId);
			photos.setProductPhotoPath(thumbpath);
			photos.setOriginFileName(thumbfilename);
			photos.setUploadFileName(thumbUploadFileName);

			BufferedOutputStream thumbBos = new BufferedOutputStream(
					new FileOutputStream(new File(saveDirectory + "/" + thumbUploadFileName)));
			thumbBos.write(thumbFile.getBytes());
			thumbBos.close();

			// DB에 썸네일 정보 저장
			photos.setThumbnail("y");

			int result = photosRepository.insert(photos);

			if (result == 0) {
				throw new Exception();
			}

		} catch (Exception e) {
			log.info(e.getMessage());
		}

		// 디테일 파일 저장 로직
		MultipartFile[] files = dto.getCustomFile();
		for (int i = 0; i < files.length; i++) {
			String filename = files[i].getOriginalFilename();
			String path = Define.UPLOAD_FILE_DERECTORY;
			String ext = StringUtils.getFilenameExtension(filename);

			String uploadFileName = "P" + now.getYear() + now.getMonthValue() + now.getDayOfMonth() + now.getHour()
					+ now.getMinute() + now.getSecond() + (int) (Math.random() * 100) + "." + ext;

			try {
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(new File(path + "/" + uploadFileName)));
				bos.write(files[i].getBytes());
				bos.close();

				ProductPhotos photos = new ProductPhotos();
				photos.setProductId(productId);
				photos.setProductPhotoPath(path);
				photos.setOriginFileName(filename);
				photos.setUploadFileName(uploadFileName);

				int result = photosRepository.insert(photos);

				if (result == 0) {
					throw new Exception();
				}

			} catch (Exception e) {
				log.info(e.getMessage());
			}
		}
		return productId;
	}

	/**
	 * @Method Name : insertPhoto
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 정보 수정 시 상품 이미지 추가 로직
	 */
	@Transactional
	public boolean insertPhoto(ProductDto dto, Integer productId) {
		MultipartFile thumb = dto.getThumbFile();
		if (thumb != null) {
			String filename = thumb.getOriginalFilename();
			String path = Define.UPLOAD_FILE_DERECTORY;
			String ext = StringUtils.getFilenameExtension(filename);
			long filesize = thumb.getSize();
			System.out.println("파일 사이즈 : " + filesize);
			if (filesize > 0) {
				LocalDateTime now = LocalDateTime.now();
				String uploadFileName = "P" + now.getYear() + now.getMonthValue() + now.getDayOfMonth() + now.getHour()
						+ now.getMinute() + now.getSecond() + (int) (Math.random() * 100) + "." + ext;

				try {
					BufferedOutputStream bos = new BufferedOutputStream(
							new FileOutputStream(new File(path + "/" + uploadFileName)));
					bos.write(thumb.getBytes());
					bos.close();

					ProductPhotos photos = new ProductPhotos();
					photos.setProductId(productId);
					photos.setProductPhotoPath(path);
					photos.setOriginFileName(filename);
					photos.setUploadFileName(uploadFileName);
					photos.setThumbnail("y");

					int result = photosRepository.insert(photos);

					if (result == 0) {
						throw new Exception();
					}

				} catch (Exception e) {
					log.info(e.getMessage());
				}
			}

		}

		MultipartFile[] files = dto.getCustomFile();
		System.out.println("파일 크기 : " + files.length);
		for (int i = 0; i < files.length; i++) {
			String filename = files[i].getOriginalFilename();
			String path = Define.UPLOAD_FILE_DERECTORY;
			String ext = StringUtils.getFilenameExtension(filename);
			long filesize = files[i].getSize();
			System.out.println("파일 사이즈 : " + filesize);
			if (filesize <= 0) {
				continue;
			}

			LocalDateTime now = LocalDateTime.now();
			String uploadFileName = "P" + now.getYear() + now.getMonthValue() + now.getDayOfMonth() + now.getHour()
					+ now.getMinute() + now.getSecond() + (int) (Math.random() * 100) + "." + ext;

			try {
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(new File(path + "/" + uploadFileName)));
				bos.write(files[i].getBytes());
				bos.close();

				ProductPhotos photos = new ProductPhotos();
				photos.setProductId(productId);
				photos.setProductPhotoPath(path);
				photos.setOriginFileName(filename);
				photos.setUploadFileName(uploadFileName);

				if (i == 0 && dto.getThumbFile() != null) {
					MultipartFile thumbFile = dto.getThumbFile();
					String thumbFilename = thumbFile.getOriginalFilename();
					String thumbUploadFileName = "thumbnail_" + thumbFilename;
					BufferedOutputStream thumbBos = new BufferedOutputStream(
							new FileOutputStream(new File(path + "/" + thumbUploadFileName)));
					thumbBos.write(thumbFile.getBytes());
					thumbBos.close();
					photos.setThumbnail("y");
				}

				int result = photosRepository.insert(photos);

				if (result == 0) {
					throw new Exception();
				}

			} catch (Exception e) {
				log.info(e.getMessage());
			}
		}
		return true;
	}


	/**
	 * @Method Name : selectProductInf
	 * @작성일 : 2024. 2. 27.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 수정에 필요한 정보 찾기
	 */
	public List<ProductDto> selectProductInf(Integer productId) {

		return productRepository.selectProductInf(productId);
	}
	

	/**
	 * @Method Name : findAllByProductId
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 해당 상품 이미지 전부 조회
	 */
	public List<ProductDto> findAllByProductId(Integer productId) {
		return photosRepository.findAllByProductId(productId);
	}

	/**
	 * @Method Name : findFileName
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 이미지 전체 조회
	 */
	public List<ProductDto> findFileName(Integer productId) {
		List<ProductDto> list = photosRepository.findAllByProductId(productId);
		return list;
	}

	/**
	 * @Method Name : deleteMutiPhoto
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 이미지 여러 장 삭제 로직
	 */
	@Transactional
	public int deleteMutiPhoto(String id) {
		log.info("----------------------");
		log.info(id);

		String[] ids = id.split(",");

		int result = 0;

		for (int i = 0; i < ids.length; i++) {
			result += photosRepository.deleteMutiPhoto(ids[i]);

		}

		if (result != 0) {
			return 1;
		} else {
			return 0;
		}

	}

	/**
	 * @Method Name : deleteProduct
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 삭제 로직
	 */
	@Transactional
	public void deleteProduct(Integer id) {
		productRepository.deletById(id);
	}

	/**
	 * @Method Name : deletePhotos
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 사진 삭제 로직
	 */
	@Transactional
	public void deletePhotos(Integer productId) {
		photosRepository.deleteByPhoto(productId);
	}

	/**
	 * @Method Name : updateProduct
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 정보 업데이트 로직
	 */
	@Transactional
	public void updateProduct(Integer id, ProductDto dto) {
		Product product = Product.builder().id(id).cityCodeId(dto.getCityCodeId()).title(dto.getTitle())
				.price(dto.getPrice()).content(dto.getContent()).build();
		productRepository.updateById(product);
	}

	/**
	 * @Method Name : getTotalProductCount
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 페이징 처리 - 총 제품 수 조회
	 */
	public int getTotalProductCount(String searchText, String cityCodeId) {
		return productRepository.getTotalCount(searchText, cityCodeId);
	}

	/**
	 * @Method Name : getProductUsingPage
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 페이징 된 제품 목록 조회
	 */
	public PageRes<Product> getProductUsingPage(PageReq pageReq, String searchText, String cityCodeId) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = productRepository.getTotalCount(searchText, cityCodeId);

		// 페이징 처리된 유저 목록 조회
		List<Product> ads = productRepository.findAllwithPasing(offset, size, searchText, cityCodeId);

		// 페이징 결과 객체 생성
		PageRes<Product> pageRes = new PageRes<>(ads, page, totalElements, size);

		return pageRes;
	}

	/**
	 * @Method Name : findAllProductDetail
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 상세보기 필요한 내용 전부 찾기
	 */
	public List<ProductDetailDto> findAllProductDetail(Integer productId) {
		return productRepository.findAllProductDetail(productId);
	}

	/**
	 * @Method Name : findProductAndUser
	 * @작성일 : 2024. 2. 27.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 상세 정보 조회
	 */
	public ProductDetailDto findProductAndUser(Integer productId) {

		ProductDetailDto list = productRepository.findProductAndUser(productId);

		return list;
	}

	/**
	 * @Method Name : findByProductImg
	 * @작성일 : 2024. 2. 27.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : detail 상품 이미지 정보
	 */
	public List<ProductPhotoDto> findByProductImg(Integer productId) {

		return productRepository.findByProductImg(productId);
	}

	/**
	 * @Method Name : findReviewByProduct
	 * @작성일 : 2024. 2. 27.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 리뷰 정보
	 */
	public List<ProductReviewDto> findReviewByProduct(Integer productId) {
		return productRepository.findReviewByProduct(productId);
	}

	/**
	 * @Method Name : popularProduct
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 인기 상품 조회
	 */
	public List<Product> popularProduct() {
		return productRepository.popularProduct();
	}

	/**
	 * @Method Name : getUploadProductsInfoByUserId
	 * @작성일 : 2024. 2. 26.
	 * @작성자 : 최장호
	 * @변경이력 :
	 * @Method 설명 : 마이페이지에서 사용자가 작성한 상품 목록
	 */
	public PageRes<UploadProductsInfoDTO> getUploadProductsInfoByUserId(PageReq pageReq, Integer userId) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = productRepository.getUploadProductsInfoTotalCount(userId);

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("offset", offset);
		map.put("size", size);

		// 페이징 처리된 유저 목록 조회
		List<UploadProductsInfoDTO> getUploadProductsInfoList = productRepository.getUploadProductsInfoByUserId(map);

		// 페이징 결과 객체 생성
		PageRes<UploadProductsInfoDTO> pageRes = new PageRes<>(getUploadProductsInfoList, page, totalElements, size);

		return pageRes;
	}

	/**
	 * @Method Name : productAvg
	 * @작성일 : 2024. 2. 28.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 평점 조회
	 */
	public ProductReviewDto productAvg(Integer productId) {
		return productRepository.productAvg(productId);
	}

	/**
	 * @Method Name : selectProductInfo
	 * @작성일 : 2024. 2. 28.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 아이디에 해당하는 상품 정보 조회
	 */
	public Product selectProductInfo(Integer productId) {
		return productRepository.selectProductInfo(productId);
	}

	/**
	 * @Method Name : findOriginNameByThumbnail
	 * @작성일 : 2024. 2. 28.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : thumbnail 의 originalName 찾기
	 */
	// 24.02.28 thumbnail 의 originalName 찾기

	public ProductThumbnailDto findOriginNameByThumbnail(Integer productId) {
		return photosRepository.findOriginNameByThumbnail(productId);
	}

	/**
	 * @Method Name : findThumbnailFileNameByProductId
	 * @작성일 : 2024. 3. 5.
	 * @작성자 : 박경진
	 * @변경이력 :
	 * @Method 설명 : productId로 thumbnail file name얻어 오기
	 */
	public String findThumbnailFileNameByProductId(Integer productId) {
		return photosRepository.findThumbnailFileNameByProductId(productId);
	}

}
