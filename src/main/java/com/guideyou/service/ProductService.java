package com.guideyou.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

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
	public boolean createProduct(ProductSaveFormDto dto) {

		// Product 저장
		Product product = Product.builder()
				.cityCodeId(dto.getCityCodeId())
				.title(dto.getTitle())
				.price(dto.getPrice())
				.content(dto.getContent())
				.build();
		
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

	public List<Product> readProduct() {
		return productRepository.findAll();
	}
	
	public List<ProductPhotos> readPhoto() {
		return photosRepository.findAll();
	}
	
	
	public Product findByProductId(Integer productId) {
		return productRepository.findByProductId(productId);
				
	}
		          
	// 사진 한 장 찾기
	public List<ProductPhotos> findPhoto(Integer ProductId) {
		return photosRepository.findPhoto(ProductId);		
	}
    
	public List<ProductPhotos> findFileName(Integer productId) {		
		List<ProductPhotos> list = photosRepository.findAllByProductId(productId);		
			return list;					
	}
}
