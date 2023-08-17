package kr.co.helf.kakaopay;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import kr.co.helf.form.AddOrderForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class KakaoPayService {

	static final String cid = "TC0ONETIME";
	static final String admin_key = "dacd2a3cef1262ad93685ddcfa9f02df";
	
	public KakaoPayReadyResponse kakaoPayReadyResponse(AddOrderForm form) {
		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
		
		param.add("cid", cid);
		param.add("partner_order_id", "partner_order_id");
		param.add("partner_user_id", "partner_user_id");
		param.add("item_name", form.getMembershipName());
		param.add("custom_json", "{\"락커\":\"" + form.getLockerName() + "\",\"운동복\":\""+form.getWearName()+ "\"}");
		param.add("quantity", String.valueOf(1));
		param.add("total_amount", String.valueOf(form.getTotalPrice()));
		param.add("tax_free_amount", "0");
		param.add("vat_amount", String.valueOf(form.getSurtax()));
		param.add("approval_url", "http://localhost/order/"); // 성공 시 redirect url
		param.add("cancel_url", "http://localhost/order/membership-list"); // 취소 시 redirect url
		param.add("fail_url", "http://localhost/order/fail"); // 실패 시 redirect url
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(param, this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		KakaoPayReadyResponse kakaoReadyResponse = template.postForObject(url, requestEntity, KakaoPayReadyResponse.class);
		log.info("결재준비 응답객체: " + kakaoReadyResponse);
		
		return kakaoReadyResponse;
	}
	
	public KakaoApproveResponse approveResponse(String tid, String pgToken) {
		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
		
		param.add("cid", cid);
		param.add("tid", tid);
		param.add("partner_order_id", "partner_order_id");
		param.add("partner_user_id", "partner_user_id");
		param.add("pg_token", pgToken);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(param, this.getHeaders());
		
		RestTemplate restTemplate = new RestTemplate();
		KakaoApproveResponse approveResponse = restTemplate.postForObject("https://kapi.kakao.com/v1/payment/approve",
															               requestEntity, KakaoApproveResponse.class);
                
        return approveResponse;
	}

	private HttpHeaders getHeaders() {
		HttpHeaders header = new HttpHeaders();
		String auth = "KakaoAK " + admin_key;
		
		header.set("Authorization", auth);
		header.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return header;
	}
}
