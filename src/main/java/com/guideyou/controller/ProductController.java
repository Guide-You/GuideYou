package com.guideyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.ProductSaveFormDto;
import com.guideyou.repository.entity.Product;
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
		return "product/testsaveForm";
	}

	/**
	 * @throws Exception
	 * @Method Name : createProduct
	 * @작성일 : 2024. 2. 16.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 등록 로직
	 */
	// TODO : 24.02.20 이미지 불러오기
	@PostMapping("/save")
	public String saveProduct(ProductSaveFormDto dto, @RequestParam("region") Integer cityCodeId) throws Exception {
		dto.setCityCodeId(cityCodeId);

		boolean result = productService.createProduct(dto);

		if (result == false) {
			throw new Exception();

		}
		return "redirect:/list";
	}

	// 상품 목록 페이지
	@GetMapping("/list")
	public String productList(PageReq pageReq, Model model, @RequestParam(required = false) String title) {
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(12); // 페이지 당 보여줄 개수
		}

		PageRes<Product> pageRes = productService.getProductUsingPage(pageReq, title); // 페이징 처리함
		List<Product> list = pageRes.getContent(); // 내용을 보여줄거다

		// 페이징 정보를 모델에 추가
		model.addAttribute("productList", list); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		List<ProductSaveFormDto> dto = productService.selectPhotoList();
		model.addAttribute("dto", dto);

//   	List<Product> product = productService.readProduct();
//   	model.addAttribute("product", product);   	

		return "product/productList";
	}

	// 상품 상세 페이지
	@GetMapping("/detail/{productId}")
	public String productDetail(@PathVariable("productId") Integer productId, Model model) {
//       List<ProductSaveFormDto> photos = productService.findAllByProductId(productId);    	
//       model.addAttribute("photos", photos);

		Product product = productService.findByProductId(productId);
		model.addAttribute("product", product);

		return "product/productDetail";
	}

	// 상품 수정 페이지
	@GetMapping("/update/{productId}")
	public String productUpdatePage(@PathVariable("productId") Integer productId, Model model) {

		List<ProductSaveFormDto> photoResult = productService.findAllByProductId(productId);
		model.addAttribute("photoResult", photoResult);

//	   List<ProductPhotos> findName = productService.findFileName(productId);    	
//     model.addAttribute("findName", findName);

		Product product = productService.findByProductId(productId);
		model.addAttribute("product", product);

		return "product/testupdate";
	}

	// TODO: [front]수정 버튼 현재 detail 페이지에 있음 추후 member upload list 페이지로 옮길 예정
	// (2024.02.21)
	// 상품 수정 기능
	// TODO : 24.02.21 이미지 삭제 미구현
	@PostMapping("/update/{productId}")
	public String updateProduct(@PathVariable("productId") Integer productId, ProductSaveFormDto dto,
			@RequestParam("region") Integer cityCodeId, @RequestParam("removeImgs") String removeImgs) {

		dto.setCityCodeId(cityCodeId);

		productService.updateProduct(productId, dto);
		productService.updatePhoto(productId, dto);

//    productService.insertPhoto(dto, productId);

		return "redirect:/list";
	}

	// TODO: [front]삭제 버튼 현재 detail 페이지에 있음 추후 member upload list 페이지로 옮길 예정
	// (2024.02.21)
	// 상품 삭제 기능
	@PostMapping("/delete/{productId}")
	public String deleteProduct(@PathVariable("productId") Integer productId) {

		productService.deleteProduct(productId);
		productService.deletePhotos(productId);
		return "redirect:/list";
	}

}