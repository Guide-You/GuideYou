package com.guideyou.controller.product;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guideyou.dto.PageReq;
import com.guideyou.dto.PageRes;
import com.guideyou.dto.product.ProductDetailDto;
import com.guideyou.dto.product.ProductDto;
import com.guideyou.dto.product.ProductPhotoDto;
import com.guideyou.dto.product.ProductReviewDto;
import com.guideyou.dto.product.ProductThumbnailDto;
import com.guideyou.handler.exception.CustomRestfulException;
import com.guideyou.repository.entity.Product;
import com.guideyou.repository.entity.User;
import com.guideyou.repository.entity.wishList.WishList;
import com.guideyou.service.PaymentService;
import com.guideyou.service.ProductService;
import com.guideyou.service.wishListService.WishListService;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpSession;

/**
 * @FileName : ProductController.java
 * @Project : GuideYou
 * @Date : 2024. 3. 4.
 * @작성자 : 장명근
 * @변경이력 :
 * @프로그램 설명 : 상품 관련 컨트롤러
 */
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private WishListService wishListService;
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private HttpSession session;

	/**
	 * @Method Name : savePage
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 등록 페이지 요청
	 */
	@GetMapping("/save")
	public String savePage(Model model, Integer productId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		return "product/testsaveForm";
	}

	/**
	 * @throws
	 * @Method Name : createProduct
	 * @작성일 : 2024. 2. 16.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 등록 로직
	 */
	@PostMapping("/save")
	@ResponseBody
	public int saveProduct(ProductDto dto, @RequestParam("region") Integer cityCodeId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		dto.setUserId(principal.getId());
		dto.setCityCodeId(cityCodeId);

		int resultProductId = productService.createProduct(dto);

		if (resultProductId == 0) {
			throw new CustomRestfulException(Define.FAIL_TO_CREATE_PRODUCT, HttpStatus.BAD_REQUEST);

		}
		return resultProductId;
	}

	/**
	 * @Method Name : productList
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 목록 페이지 요청
	 */
	@GetMapping("/list")
	public String productList(PageReq pageReq, Model model, @Param("searchText") String searchText,
			@Param("cityCodeId") String cityCodeId) {
		System.out.println(searchText);
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(12); // 페이지 당 보여줄 개수
		}

		PageRes<Product> pageRes = productService.getProductUsingPage(pageReq, searchText, cityCodeId); // 페이징 처리함
		List<Product> list = pageRes.getContent(); // 내용을 보여줄거다
		// 페이징 정보를 모델에 추가
		model.addAttribute("productList", list); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		return "product/productList";
	}

	/**
	 * @Method Name : productDetail
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 상세 페이지 요청
	 */
	@GetMapping("/detail/{productId}")
	public String productDetail(@PathVariable("productId") Integer productId, Model model) {

		// TODO: 상품 이미지 불러 오기 및 리뷰 추가하기, 구매 전 페이지 - 구매 후 페이지 구현 하기

		ProductDetailDto product = productService.findProductAndUser(productId);
		model.addAttribute("product", product);

		List<ProductPhotoDto> imgList = productService.findByProductImg(productId);
		model.addAttribute("imgList", imgList);

		String thumbnailFileName = productService.findThumbnailFileNameByProductId(productId);
		model.addAttribute("thumbnailFileName", thumbnailFileName);

		List<ProductReviewDto> reviewList = productService.findReviewByProduct(productId);
		model.addAttribute("reviewList", reviewList);

		ProductReviewDto productAvg = productService.productAvg(productId);
		model.addAttribute("productAvg", productAvg);

		// TODO: line 164, 165 -> Boolean 임포트 안되서 boolean으로 변경 확인 해주세요.
		boolean paidYn = false;
		boolean wishYn = false;
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal != null) {

			int paidProductId = paymentService.getPaidProductIdByUserIdAndProductId(principal.getId(), productId);
			if (paidProductId != 0 || product.getUserId() == principal.getId()) {
				paidYn = true;
			}
			WishList wishResult = wishListService.readWishListByUserIdAndProductId(principal.getId(), productId);
			if (wishResult != null) {
				wishYn = true;
			}
		}

		model.addAttribute("paidYn", paidYn);
		model.addAttribute("wishYn", wishYn);

		return "product/productDetail";
	}

	/**
	 * @Method Name : productUpdatePage
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 수정 페이지 요청
	 */
	@GetMapping("/update/{productId}")
	public String productUpdatePage(@PathVariable("productId") Integer productId, Model model) {
		// TODO: 유효성 검사
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}

		List<ProductDto> photoResult = productService.findAllByProductId(productId);
		ProductDto thumbnail = new ProductDto();
		List<ProductDto> details = new ArrayList<>();
		model.addAttribute("photoResult", photoResult);
		for (ProductDto product : photoResult) {
			if ("y".equals(product.getThumbnail())) {
				thumbnail = product;
			} else {
				details.add(product);
			}
		}
		model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("details", details);

		Product ProductInfo = productService.selectProductInfo(productId);
		model.addAttribute("ProductInfo", ProductInfo);

		ProductThumbnailDto thumb = productService.findOriginNameByThumbnail(productId);
		model.addAttribute("thumb", thumb);

		return "product/testupdate";
	}

	/**
	 * @Method Name : updateProduct
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 수정 로직
	 */
	@PostMapping("/edit/{productId}")
	public String updateProduct(@PathVariable("productId") Integer productId, ProductDto dto,
			@RequestParam("region") Integer cityCodeId) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		if (principal == null) {
			throw new CustomRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}

		dto.setCityCodeId(cityCodeId);

		productService.updateProduct(productId, dto);
		List<ProductDto> photoList = productService.findAllByProductId(productId);
		List<Integer> photoIdList = photoList.stream().map(ProductDto::getId).collect(Collectors.toList());
		productService.deletePhotosByIdList(photoIdList);
		dto.setUserId(principal.getId());
		dto.setProductId(productId);
		int resultProductId = productService.createProduct(dto);

		if (resultProductId == 0) {
			throw new CustomRestfulException(Define.FAIL_TO_CREATE_PRODUCT, HttpStatus.BAD_REQUEST);

		}
//	   	if (removeImgs != null && !removeImgs.isEmpty() && !removeImgs.equals("")) {
//	   		productService.deleteMutiPhoto(removeImgs);
//			
//		}

	//	productService.insertPhoto(dto, productId);

		return "redirect:/list";
	}

	/**
	 * @Method Name : deleteProduct
	 * @작성일 : 2024. 3. 4.
	 * @작성자 : 장명근
	 * @변경이력 :
	 * @Method 설명 : 상품 삭제 로직
	 */
	@GetMapping("/delete/{productId}")
	public String deleteProduct(@PathVariable("productId") Integer productId) {

		productService.deleteProduct(productId);
		productService.deletePhotos(productId);
		return "redirect:/list";
	}

}