package com.guideyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.repository.entity.Product;
import com.guideyou.repository.entity.ProductPhotos;
import com.guideyou.service.ProductService;

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
      * @throws Exception 
     * @Method Name : createProduct
      * @작성일 : 2024. 2. 16.
      * @작성자 : 장명근
      * @변경이력 : 
      * @Method 설명 : 상품 등록 로직
      */
    @PostMapping("/save")
    public String saveProduct(ProductSaveFormDto dto, @RequestParam("region") Integer cityCodeId) throws Exception {
    	dto.setCityCodeId(cityCodeId);
    	   	
    	boolean result = productService.createProduct(dto);
    	
    	
    	if (result == false) {
    		throw new Exception();
			
		}
    	return "redirect:/list";
    }
        
     
    @GetMapping("/list")
    public String getAllProductsWithPhotos(Model model) {    	
    	
    	
    	List<Product> product = productService.readProduct();
    	model.addAttribute("product", product);
        
    	List<ProductPhotos> photos = productService.readPhoto();
    	model.addAttribute("photos", photos);
    	
    	
    	
        return "product/list";
    }
    
    
    @GetMapping("/list/{productId}")
    public String productDetail(@PathVariable("productId") Integer productId, Model model) {
        List<ProductPhotos> findName = productService.findFileName(productId);    	
        model.addAttribute("findName", findName);
        
        Product product = productService.findByProductId(productId);
        model.addAttribute("product", product);
        
        return "product/detail";
    }
    
}
