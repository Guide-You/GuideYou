package com.guideyou.repository.interfaces.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.payment.PurchasedProductInfoDTO;
import com.guideyou.dto.payment.RefundDto;
import com.guideyou.repository.entity.Payment;
import com.guideyou.repository.entity.PaymentDetail;

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
	public int insertPayment(Payment payment);
	public Payment findByUserId(Integer userId);
	public List<PurchasedProductInfoDTO> getPurchasedProductInfoList(Integer userId);
	public Payment findByMerchantUid(String merchantUid);
	public Payment findByMerchantUidAndUserId(String merchantUid, Integer userId);
	public int updatePaymentOnRefund(RefundDto refundDto);
}
