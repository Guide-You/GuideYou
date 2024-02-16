package com.guideyou.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
        
        // 파일 저장 및 ProductPhotos 저장
        if (dto.getCustomFile() != null) {
            try {
                // 파일 저장
                MultipartFile file = dto.getCustomFile();
                String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                String filePath = Define.UPLOAD_FILE_DIRECTORY + File.separator + fileName;
                File destination = new File(filePath);
                file.transferTo(destination);
                
                // ProductPhotos 저장
                ProductPhotos photos = new ProductPhotos();
                photos.setProduct_photo(file);
                photos.setFilePath(filePath);
                photosRepository.insert(photos);
            } catch (IOException e) {
                e.printStackTrace();
                // 파일 저장 중 오류 발생 시 처리
            }
        }
    }
    
    // 임시 사용자 ID 생성 로직 (UUID 사용)
    private Integer generateUserId() {
        return UUID.randomUUID().hashCode();
    }
}
