package kr.co.helf.kakaopay;

import kr.co.helf.form.AddOrderForm;

public interface KakaopayInterface {
	
	public KakaoPayReadyResponse kakaoPayReadyResponse(AddOrderForm form);

	public KakaoApproveResponse approveResponse(String tid, String pgToken);
}
