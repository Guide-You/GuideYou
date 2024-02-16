package com.guideyou.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.service.ProductService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private HttpSession httpSession;

    // 상품 등록 페이지
    @GetMapping("/save")
    public String savePage() {
        return "product/saveForm";
    }

    /**
      * @Method Name : createProduct
      * @작성일 : 2024. 2. 16.
      * @작성자 : 장명근
      * @변경이력 : 
      * @Method 설명 : 상품 등록 로직
      */
    @PostMapping("/save")
    public String createProduct(ProductSaveFormDto dto) {
        // 현재 로그인한 사용자의 ID를 가져와서 DTO에 설정
        Integer userId = (Integer) httpSession.getAttribute("userId");
        dto.setUserId(userId);
        
        File uploadDirectory = new File(Define.UPLOAD_FILE_DIRECTORY);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs(); // 디렉토리 생성
        }

        MultipartFile file = dto.getCustomFile();
        UUID uuid = UUID.randomUUID();
        String fileName = uuid + "_" + file.getOriginalFilename();
        dto.setOriginFileName(file.getOriginalFilename());
        dto.setUploadFileName(fileName);
        String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName;
        File destination = new File(uploadPath);
        try {
            file.transferTo(destination);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        dto.setOriginFileName(file.getOriginalFilename());
        dto.setUploadFileName(fileName);

        productService.createProduct(dto);

        return "redirect:/save";
    }
}
