package com.guideyou.repository.interfaces.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.payment.PurchasedProductInfoDTO;
import com.guideyou.repository.entity.Payment;

/**
  * @FileName : PaymentRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 :PaymentRepository
  */
@Mapper
public interface PaymentRepository {
	public int insert(Payment payment);
	public Payment findByUserId(Integer userId);
	public List<PurchasedProductInfoDTO> getPurchasedProductInfoList(Integer userId);
}
