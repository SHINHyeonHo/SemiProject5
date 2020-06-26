package util.habibi;

import javax.servlet.http.HttpServletRequest;

public class HabibiUtil {

	// *** ? 다음의 데이터까지 포함한 URL 주소를 알아오는 메소드 생성 *** //
	
			public static String getCurrentURL(HttpServletRequest request) {
				
				String currentURL = request.getRequestURL().toString();
				// http://localhost:9090/MyMVC/shop/prodView.up
				
				String queryString = request.getQueryString();
				// pnum=3
				
				currentURL += "?"+queryString;
				// http://localhost:9090/MyMVC/shop/prodView.up?pnum=3
				
				String ctxPath = request.getContextPath();
				// /MyMVC
				
				int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
				//		27	   =	 21			+ 6
				
				currentURL = currentURL.substring(beginIndex+1);
				//						28	
				
				return currentURL;
			}
	
}
