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
import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.repository.entity.Product;
import com.guideyou.repository.entity.ProductPhotos;
import com.guideyou.repository.interfaces.ProductPhotosRepository;
import com.guideyou.repository.interfaces.ProductRepository;
import com.guideyou.utils.Define;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductPhotosRepository photosRepository;

	// 상품 등록
	@Transactional
	public boolean createProduct(ProductSaveFormDto dto) {

		// Product 저장
		Product product = Product.builder().cityCodeId(dto.getCityCodeId()).title(dto.getTitle()).price(dto.getPrice())
				.content(dto.getContent()).build();

		productRepository.insert(product);
		int productId = product.getId();

		String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
		// 폴더가 없다면 오류 발생(파일 생성시)
		File dir = new File(saveDirectory);
		if (dir.exists() == false) {
			dir.mkdir(); // 폴더가 없으면 폴더 생성
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
	public boolean insertPhoto(ProductSaveFormDto dto, Integer productId) {
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

	// citycode로 인한 출력
	public List<ProductSaveFormDto> getProductsByCityCode(String cityCode) {
		return productRepository.findProductsByCityCode(cityCode);
	}

	public List<Product> readProduct() {
		return productRepository.findAll();
	}

	public ProductPhotos readPhoto() {

		return photosRepository.findPhoto();
	}

	// 상품에 해당하는 사진 한 장 찾기
	public List<ProductSaveFormDto> selectPhotoList() {
		return photosRepository.selectPhotoList();
	}

	public Product findByProductId(Integer id) {
		return productRepository.findByProductId(id);

	}

	// 해당 상품 이미지 전부 찾기
	public List<ProductSaveFormDto> findAllByProductId(Integer productId) {
		return photosRepository.findAllByProductId(productId);
	}

	public List<ProductSaveFormDto> findFileName(Integer productId) {
		List<ProductSaveFormDto> list = photosRepository.findAllByProductId(productId);
		return list;
	}

	// 검색
	@Transactional
	public List<Product> search(String keyword) {

		List<Product> productList = productRepository.findByTitleContaining(keyword);

		return productList;

	}

	// 사진 한 장과 상품 설명
	public List<Product> getProductsWithImages() {
		return productRepository.findProductsWithImages();
	}

	// 이미지 부분 삭제
	@Transactional
	public int deleteMutiPhoto(Integer productId, String id) {
		System.out.println("-----------------------------------");
		System.out.println(productId);
		System.out.println(id);

		String[] ids = id.split(",");

		return photosRepository.deleteMutiPhoto(productId, ids);
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
	public void updateProduct(Integer id, ProductSaveFormDto dto) {
		Product product = Product.builder().id(id).cityCodeId(dto.getCityCodeId()).title(dto.getTitle())
				.price(dto.getPrice()).content(dto.getContent()).build();
		productRepository.updateById(product);
	}

	@Transactional
	public Boolean updatePhoto(Integer id, ProductSaveFormDto dto) {

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

				int result = photosRepository.updateById(photos);

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
	public int getTotalProductCount() {
		return productRepository.getTotalCount();
	}

	// 페이징 된 제품 목록 조회
	public PageRes<Product> getProductUsingPage(PageReq pageReq, String title) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = productRepository.getTotalCount();

		// 페이징 처리된 유저 목록 조회
		List<Product> ads = productRepository.findAllwithPasing(offset, size, title);

		// 페이징 결과 객체 생성
		PageRes<Product> pageRes = new PageRes<>(ads, page, totalElements, size);

		return pageRes;
	}

	// 비동기적 페이징 처리
	public PageRes<Product> productUsingPage(PageReq pageReq) {
		return productRepository.getProductsWithPaging(pageReq);
	}
	
	
	// 인기 상품 조회
	public List<Product> popularProduct() {
		return productRepository.popularProduct();
	}
	
	
	
	
	
	

}
