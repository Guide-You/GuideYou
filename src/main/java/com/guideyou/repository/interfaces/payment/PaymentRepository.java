package com.guideyou.repository.interfaces.payment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.guideyou.dto.payment.PaymentCompleteDto;
import com.guideyou.dto.payment.PaymentDto;
import com.guideyou.dto.payment.PaymentHistoryListDto;
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
	public List<PurchasedProductInfoDTO> getPurchasedProductInfoList(Map<String, Object> params);
	public Long getPurchasedProductInfoListTotalCount(Integer userId);
	public Payment findByMerchantUid(String merchantUid);
	//public Payment findByMerchantUidAndUserId(String merchantUid, Integer userId);
	public int findByMerchantUidAndUserId(Map<String, Object> params);
	public int updatePaymentOnRefund(RefundDto refundDto);
	public PaymentCompleteDto findPaymentAndPaymentDetailMerchantUid(String merchantUid);
	public int getPaidProductIdByUserIdAndProductId(Map<String, Object> params);
	public List<PaymentHistoryListDto> getPaymentHistoryList(Map<String, Object> params);
	public Long getPaymentHistoryListTotalCount(Integer userId);
}
