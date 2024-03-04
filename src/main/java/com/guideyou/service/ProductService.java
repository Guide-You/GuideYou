package com.guideyou.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.List;

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

	// 상품 등록
	@Transactional
	public boolean createProduct(ProductDto dto) {
	    // Product 저장
	    Product product = Product.builder()
	            .userId(dto.getUserId())
	            .cityCodeId(dto.getCityCodeId())
	            .title(dto.getTitle())
	            .price(dto.getPrice())
	            .introContent(dto.getIntroContent())
	            .content(dto.getContent())
	            .build();

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

	    MultipartFile[] files = dto.getCustomFile();
	    for (int i = 0; i < files.length; i++) {
	        String filename = files[i].getOriginalFilename();
	        String path = Define.UPLOAD_FILE_DERECTORY;
	        String ext = StringUtils.getFilenameExtension(filename);

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

	            // 첫 번째 파일이면서 썸네일 파일이 있는 경우에만 썸네일을 설정
	            if (i == 0 && dto.getThumbFile() != null) {
	                MultipartFile thumbFile = dto.getThumbFile();
	                String thumbFilename = thumbFile.getOriginalFilename();
	                // 썸네일 파일 저장 로직 추가
	                String thumbUploadFileName = "thumbnail_" + thumbFilename; // 썸네일 파일명 설정
	                BufferedOutputStream thumbBos = new BufferedOutputStream(
	                        new FileOutputStream(new File(savePath + "/" + thumbUploadFileName)));
	                thumbBos.write(thumbFile.getBytes());
	                thumbBos.close();

	                // DB에 썸네일 정보 저장
	                photos.setThumbnail("y");
	            }

	            int result = photosRepository.insert(photos);

	            if (result == 0) {
	                throw new Exception();
	            }

	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
	    }
	    return true;
	}

		@Transactional
		public boolean insertPhoto(ProductDto dto, Integer productId) {
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
		            System.out.println(e.getMessage());
		        }
		    }
		    return true;
		}

	

	public List<Product> readProduct() {
		return productRepository.findAll();
	}
	
	public ProductPhotos readPhoto() {

		return photosRepository.findPhoto();
	}

	// 상품에 해당하는 사진 한 장 찾기
	public List<ProductDto> selectPhotoList() {
		return photosRepository.selectPhoto();
	}
	
	
	// 24.02.27 수정에 필요한 정보 찾기
	public List<ProductDto> selectProductInf(Integer productId) {
		
		return productRepository.selectProductInf(productId); 
	}
	
	
	
	public ProductDetailDto findByProductId(Integer productId) {
		return productRepository.findByProductId(productId);

	}
	
	// 해당 상품 이미지 전부 찾기
	public List<ProductDto> findAllByProductId(Integer productId) {
		return photosRepository.findAllByProductId(productId);
	}

	public List<ProductDto> findFileName(Integer productId) {
		List<ProductDto> list = photosRepository.findAllByProductId(productId);
		return list;
	}

	
	// 사진 한 장과 상품 설명
	public List<Product> getProductsWithImages(int offset, int limit, String searchText) {
		return productRepository.findProductsWithImages(offset, limit, searchText);
	}

	// 이미지 부분 삭제
		@Transactional
		public int deleteMutiPhoto(String id) {
			System.out.println("================================");
			System.out.println(id);
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

	// 상품 삭제
	@Transactional
	public void deleteProduct(Integer id) {
		productRepository.deletById(id);
	}

	// 사진 삭제
	@Transactional
	public void deletePhotos(Integer productId) {
		photosRepository.deleteByPhoto(productId);
	}

	// 상품 정보 업데이트
	@Transactional
	public void updateProduct(Integer id, ProductDto dto) {
		Product product = Product.builder()
				.id(id)
				.cityCodeId(dto.getCityCodeId())
				.title(dto.getTitle())
				.price(dto.getPrice())
				.content(dto.getContent())
				.build();
		productRepository.updateById(product);
	}

	@Transactional
	public Boolean updatePhoto(Integer id, ProductDto dto) {

		MultipartFile[] files = dto.getCustomFile();
		for (int i = 0; i < files.length; i++) {
			String filename = files[i].getOriginalFilename();
			String path = Define.UPLOAD_FILE_DERECTORY;
			String ext = StringUtils.getFilenameExtension(filename);

			LocalDateTime now = LocalDateTime.now();
			String uploadFileName = "P" + now.getYear() + now.getMonthValue() + now.getDayOfMonth() + now.getHour()
					+ now.getMinute() + now.getSecond() + (int) (Math.random() * 100) + "." + ext;

			try {
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(new File(path + "/" + uploadFileName)));
				bos.write(files[i].getBytes());
				bos.close();

				ProductPhotos photos = ProductPhotos.builder().productPhotoPath(dto.getProductPhotoPath())
						.originFileName(dto.getOriginFileName()).uploadFileName(dto.getUploadFileName()).build();

				int result = photosRepository.insert(photos);

				if (result == 0) {
					throw new Exception();
				}

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
		return true;

	}

	// 페이징 처리 - 총 제품 수 조회
	public int getTotalProductCount(String searchText, String cityCodeId) {
		return productRepository.getTotalCount(searchText, cityCodeId);
	}

	// 페이징 된 제품 목록 조회
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

	// 상품 상세보기 필요한 내용 전부 찾기
	public List<ProductDetailDto> findAllProductDetail(Integer productId) {
		return productRepository.findAllProductDetail(productId);
	}
	
	// 24.02.27 detail 상품 정보
	public ProductDetailDto findProductAndUser(Integer productId) {
		
		ProductDetailDto list = productRepository.findProductAndUser(productId);
		
		return list;
	}
	
	// 24.02.27 detail 상품 이미지 정보
	public List<ProductPhotoDto> findByProductImg(Integer productId) {
		
		return productRepository.findByProductImg(productId);
	}
	
	
	// 24.02.27 review 상품 리뷰 정보
	public List<ProductReviewDto> findReviewByProduct(Integer productId) {
		return productRepository.findReviewByProduct(productId);
	}
	
	
	
	// 인기 상품 조회
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
	public List<UploadProductsInfoDTO> getUploadProductsInfoByUserId(Integer userId) {
		List<UploadProductsInfoDTO> getUploadProductsInfoList = productRepository.getUploadProductsInfoByUserId(userId);
		return getUploadProductsInfoList;
	}
	
	
	
	// 이미지 업로드 이름 찾기
	public List<ProductPhotoDto> photos(Integer productId) {
		return productRepository.photos(productId);
	}
	
	// 24.02.28 상품 평점 조회
	public ProductReviewDto productAvg(Integer productId) {
		return productRepository.productAvg(productId);
	}
	

	// 24.02.28 아이디에 해당하는 상품 정보 조회
	public Product selectProductInfo(Integer productId) {
		return productRepository.selectProductInfo(productId);
	}	
	
	// 24.02.28 thumbnail 의 originalName 찾기
//	public ProductThumbnailDto findOriginNameByThumbnail(Integer productId) {
//		return productRepository.findOriginNameByThumbnail(productId);
//	}
	
	
	
	
	
	
	
	
	
	
	

}
