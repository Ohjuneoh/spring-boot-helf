package kr.co.helf.security.oauth.info;

import java.util.Map;

public class OAuth2UserInfo {

	private Map<String, Object> attributes;
	
	public OAuth2UserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	public Map<String, Object> getAttributes() {
		return attributes;
	}
	
	public String getId() {
		return getAttributes().get("id").toString();
	}
	
	@SuppressWarnings("unchecked")
	public String getName() {
		Map<String, Object> properties = (Map<String, Object>) getAttributes().get("properties");
		if (properties == null) {
			return null;
		}
		return (String) properties.get("nickname");
	}
	
	@SuppressWarnings("unchecked")
	public String getEmail() {
		Map<String, Object> kakaoAccount = (Map<String, Object>) getAttributes().get("kakao_account");
		if (kakaoAccount == null) {
			return null;
		}
		return (String) kakaoAccount.get("email");
	}
}