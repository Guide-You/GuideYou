package com.guideyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.service.ProductService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;


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
    public String createProduct(ProductSaveFormDto dto){
        // 현재 로그인한 사용자의 ID를 가져와서 DTO에 설정
        Integer userId = (Integer) httpSession.getAttribute("userId");
        dto.setUserId(userId);

        productService.createProduct(dto);

        return "redirect:/save";
    }
    
    @GetMapping("/list")
    public String listPage() {
        return "product/list";
    }
    
    
    
}
