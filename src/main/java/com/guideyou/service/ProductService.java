package com.guideyou.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.repository.entity.Product;
import com.guideyou.repository.entity.ProductPhotos;
import com.guideyou.repository.interfaces.ProductPhotosRepository;
import com.guideyou.repository.interfaces.ProductRepository;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ProductService {
    
    @Autowired
    private ProductRepository productRepository;
    
    @Autowired
    private ProductPhotosRepository photosRepository;
    
    // 상품 등록
    public void createProduct(ProductSaveFormDto dto) {
        
        // 사용자 ID 생성 및 할당 (임시로 UUID 사용)
        Integer userId = generateUserId();
        dto.setUserId(userId);
        
        // Product 저장
        Product product = new Product();
        product.setUser_id(dto.getUserId()); // 변경된 부분: 사용자 ID 설정
        product.setTitle(dto.getTitle());
        product.setPrice(dto.getPrice());
        product.setContent(dto.getContent());
        productRepository.insert(product);
        int productId = product.getId();
        
        MultipartFile[] files = dto.getCustomFile();
        for(int i = 0; i < files.length; i++) {
        	String filename = files[i].getOriginalFilename();
        	String path = Define.UPLOAD_FILE_DERECTORY;
        	String ext = StringUtils.getFilenameExtension(filename);
        	
        	LocalDateTime now = LocalDateTime.now();
        	String uploadFileName = "P" + now.getYear() + now.getMonthValue() + now.getDayOfMonth() 
        	+ now.getHour() + now.getMinute() + now.getSecond() + (int) (Math.random() * 100) + "." + ext;
        	
        	try {
        		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(path + "/" + uploadFileName)));
        		bos.write(files[i].getBytes());
        		bos.close();
        		
        		ProductPhotos photos = new ProductPhotos();
        		photos.setProduct_id(productId);
        		photos.setProduct_photo_path(path);
        		photos.setOrigin_file_name(filename);
        		photos.setUpload_file_name(uploadFileName);
        		photosRepository.insert(photos);
        	} catch (Exception e) {
        		System.out.println(e.getMessage());
        	}
        }
        
    }
    
    // 임시 사용자 ID 생성 로직 (UUID 사용)
    private Integer generateUserId() {
        return UUID.randomUUID().hashCode();
    }
}
