package util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class cookies {
	private HashMap<String, Cookie> cookieMap = new HashMap<>();

	public void Cookies(HttpServletRequest request) { // 매개변수가 1개인 생성자
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				// 쿠키의 이름을 키로, 쿠키 객체를 값으로 HashMap에 추가
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}

	public Cookie getcookie(String name) { // 메소드
		return cookieMap.get(name);
	}

	public String getValue(String name) throws IOException {
		Cookie cookie = cookieMap.get(name);
		if (cookie == null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}

	public boolean exists(String name) {
		return cookieMap.get(name) != null;
	}

	public static Cookie createCookie(String name, String value) throws IOException {
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}
	
	public static Cookie createCookie(String name, String value, String path, int maxAge)throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value,"utf-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;		
	}
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
}