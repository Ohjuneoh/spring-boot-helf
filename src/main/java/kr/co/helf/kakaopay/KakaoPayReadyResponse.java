package kr.co.helf.kakaopay;

import lombok.Data;

@Data
public class KakaoPayReadyResponse {

    private String tid; // 결제 고유 번호
    private String next_redirect_pc_url; // pc 웹일 경우 받는 결제 페이지
}
