package kr.co.helf.kakaopay;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
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
@Component
public class KakaoPayService implements KakaopayInterface {

	@Value("${custom.oauth.cid}")
    private String cid;

    @Value("${custom.oauth.admin_key}")
    private String adminKey;
	
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
		param.add("approval_url", "http://localhost/order/kakaopay-progress"); // 성공 시 redirect url
		param.add("cancel_url", "http://localhost/order/kakaopay-cancle"); // 취소 시 redirect url
		param.add("fail_url", "http://localhost/order/kakaopay-fail"); // 실패 시 redirect url
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(param, this.getHeaders());
		// MultiValueMap<String, String> 타입을 저장할 수 있는 HttpEntity 객체를 생성해서 param을 본문에 담고 this.getHeaders()를 헤더에 담는다. 
		
		RestTemplate template = new RestTemplate();
		// HTTP 통신을 간편하게 할 수 있는 클래스다.
		
		String url = "https://kapi.kakao.com/v1/payment/ready";
		KakaoPayReadyResponse kakaoReadyResponse = template.postForObject(url, requestEntity, KakaoPayReadyResponse.class);
		// 변수 url에 저장된 링크로 requestEntity를 보낸다. 그리고 응답을 KakaoPayReadyResponse에 저장해서 받는다.
		
		log.info("결제준비 응답객체: " + kakaoReadyResponse);
		
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
		String auth = "KakaoAK " + adminKey;
		
		header.set("Authorization", auth);
		header.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return header;
	}
}
