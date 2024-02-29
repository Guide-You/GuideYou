package com.guideyou.repository.interfaces.payment;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.repository.entity.PaymentDetail;

/**
  * @FileName : PaymentDetailRepository.java
  * @Project : GuideYou
  * @Date : 2024. 2. 29. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 :Payment detail Repository
  */

@Mapper
public interface PaymentDetailRepository {
	public int insertPaymentDetail(PaymentDetail paymentDetail);
}
