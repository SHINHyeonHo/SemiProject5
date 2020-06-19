package common.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		description = "�궗�슜�옄媛� �쎒�뿉�꽌 *.hb 瑜� �뻽�쓣 寃쎌슦 �씠 �꽌釉붾┸�씠 癒쇱� �쓳�떟�쓣 �빐二쇰룄濡� �븳�떎.", 
		urlPatterns = { "*.hb" }, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "C:/Users/rubyr/Documents/SemiProject/SemiProject/WebContent/WEB-INF/HbbCommand.properties", description = "*.hb �뿉 ���븳 �겢�옒�뒪�쓽 留ㅽ븨�뙆�씪")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Map<String, Object> cmdMap = new HashMap<String, Object>();

	public void init(ServletConfig config) throws ServletException {

		/*
			�쎒釉뚮씪�슦�� 二쇱냼李쎌뿉�꽌 *.up �쓣 �븯硫� FrontController �꽌釉붾┸�씠 �쓳��瑜� �빐�삤�뒗�뜲
			留� 泥섏쓬�뿉 �옄�룞�쟻�쑝濡� �떎�뻾�릺�뼱吏��뒗 硫붿냼�뱶媛� init(ServletConfig config) �씠�떎.
			�뿬湲곗꽌 以묒슂�븳 寃껋� init(ServletConfig config) 硫붿냼�뱶�뒗 WAS(�넱罹�)媛� 援щ룞�릺�뼱吏� �썑 
			�뵳 1踰덈쭔 init(ServletConfig config) 硫붿냼�뱶媛� �떎�뻾�릺�뼱吏�怨�, 洹� �씠�썑�뿉�뒗 �떎�뻾�씠 �릺吏� �븡�뒗�떎.
		 */
	
		// *** �솗�씤�슜 ***
		// System.out.println("~~~ �솗�씤�슜 => �꽌釉붾┸ FrontController �쓽 init(ServletConfig config) 硫붿냼�뱶媛� �떎�뻾�맖.");
		// ~~~ �솗�씤�슜 => �꽌釉붾┸ FrontController �쓽 init(ServletConfig config) 硫붿냼�뱶媛� �떎�뻾�맖.
		
		Properties pr = new Properties(); 
		// Properties �뒗 Collection 以� HashMap 怨꾩뿴以묒쓽  �븯�굹濡쒖뜥
		// "key","value"�쑝濡� �씠猷⑥뼱�졇 �엳�뒗寃껋씠�떎.
		// 洹몃윴�뜲 以묒슂�븳 寃껋� Properties �뒗 key�룄 String ���엯�씠怨�, value�룄 String ���엯留� 媛��뒫�븯�떎�뒗 寃껋씠�떎.
		// key�뒗 以묐났�쓣 �뿀�씫�븯吏� �븡�뒗�떎. value 媛믪쓣 �뼸�뼱�삤湲� �쐞�빐�꽌�뒗 key媛믩쭔 �븣硫� �맂�떎.
		
		
		FileInputStream fis = null;
		// �듅�젙 �뙆�씪�뿉 �궡�슜�쓣 �씫�뼱�삤湲� �쐞�븳 �슜�룄濡� �벐�씠�뒗 媛앹껜
		
		try {
			String props = config.getInitParameter("propertyConfig");
			// System.out.println("~~~ �솗�씤�슜 props => " + props);
			// ~~~ �솗�씤�슜 props => C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties
			
			fis = new FileInputStream(props);
			// fis �뒗 C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties �뙆�씪�쓽 �궡�슜�쓣 �씫�뼱�삤湲� �쐞�븳 �슜�룄濡� �벐�씠�뒗 媛앹껜瑜� �깮�꽦�븿.

			pr.load(fis);
			/*
			    fis 媛앹껜瑜� �궗�슜�븯�뿬 C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties �뙆�씪�쓽 �궡�슜�쓣 �씫�뼱�떎媛� 
			    Properties �겢�옒�뒪�씠 媛앹껜�씤 pr �뿉 濡쒕뱶�떆�궓�떎. 
			       洹몃윭硫� pr �� �씫�뼱�삩 �뙆�씪(Command.properties)�쓽 �궡�슜�뿉�꽌
			    = �쓣 湲곗��쑝濡� �쇊履쎌� key濡� 蹂닿퀬, �삤瑜몄そ�� value 濡� �씤�떇�븳�떎.	  
			 */

			Enumeration<Object> en = pr.keys();
			/*
			    pr.keys(); �� 
			    C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties �뙆�씪�쓽 �궡�슜臾쇱뿉�꽌 
			    = �쓣 湲곗��쑝濡� �쇊履쎌뿉 �엳�뒗 紐⑤뱺 key �뱾留� 媛��졇�삤�뒗 寃껋씠�떎.  	
			*/

			while( en.hasMoreElements() ) { // �궎媛믪씠 �엳�뒗吏� �솗�씤
				
				String key = (String)en.nextElement();
				// en.nextElement(); �� 由ы꽩 ���엯�씠 Object�씠誘�濡� String �쑝濡� 罹먯뒪�똿�쓣 �븳�떎.
				
				//System.out.println("~~~ �솗�씤�슜 key => " + key);
				//System.out.println("~~~ �솗�씤�슜 value => " + pr.getProperty(key));
				/*
				 	~~~ �솗�씤�슜 key => /main.up
					~~~ �솗�씤�슜 value => common.controller.MainController
					
					~~~ �솗�씤�슜 key => /index.up
					~~~ �솗�씤�슜 value => common.controller.IndexController
				 */
				
				
				String className = pr.getProperty(key); // value 媛�
				
				if( className != null ) {
					className = className.trim();
					
					Class<?> cls = Class.forName(className);
					// <?> �뒗 �겢�옒�뒪媛� 諛섎뱶�떆 �븳媛쒓� �엳�떎�뒗 留먯씠�떎.
					// value 媛믪쓣 Class 濡� �씤�떇�븯寃좊떎�뒗 留먯씠�떎.
					// common.controller.MainController �벑�벑 �쓣 Class 濡� 蹂닿쿋�떎�뒗 留�.
					// String ���엯�쑝濡� �릺�뼱吏� className �쓣 �겢�옒�뒪�솕 �떆耳쒖＜�뒗 寃껋씠�떎.
					// 二쇱쓽�븷 �젏�� �떎�젣濡� String �쑝濡� �릺�뼱�졇 �엳�뒗 臾몄옄�뿴�씠 �겢�옒�뒪濡� 議댁옱�빐�빞留� �븳�떎�뒗 寃껋씠�떎.

					Object obj = cls.newInstance();
					// �겢�옒�뒪濡� 遺��꽣 �떎�젣 媛앹껜(�씤�뒪�꽩�뒪)瑜� �깮�꽦�빐二쇰뒗 寃껋씠�떎.
					
					// System.out.println("~~~ �솗�씤�슜 obj.toString() => " + obj.toString());
					/*
					 	~~~ �솗�씤�슜 obj.toString() => �겢�옒�뒪  MainController �쓽 �씤�뒪�꽩�뒪 硫붿냼�뱶 toString() �샇異쒗븿.
						~~~ �솗�씤�슜 obj.toString() => �겢�옒�뒪  IndexController �쓽 �씤�뒪�꽩�뒪 硫붿냼�뱶 toString() �샇異쒗븿.
					*/
					
					cmdMap.put(key, obj);
					// cmdMap �뿉�꽌 �궎媛믪쑝濡� Command.properties �뙆�씪�뿉 ���옣�릺�뼱吏� url �쓣 二쇰㈃ 
					// cmdMap �뿉�꽌 �빐�떦 �겢�옒�뒪�뿉 ���븳 媛앹껜(�씤�뒪�꽩�뒪)瑜� �뼸�뼱�삤�룄濡� 留뚮뱺 寃껋씠�떎.
					
					
				} // end of if()
				
				
			} // end of while( en.hasMoreElements() ) {}
			
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println(">>> 臾몄옄�뿴濡� 紐낅챸�릺�뼱吏� �겢�옒�뒪媛� 議댁옱�븯吏� �븡�뒿�땲�떎. <<<");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.out.println(">>> C:/SemiProject/SemiProject/WebContent/WEB-INF/HbbCommand.properties �뙆�씪�씠 �뾾�뒿�땲�떎. <<<");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		
	} // end of public void init(ServletConfig config) throws ServletException {}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		requestProcess(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		requestProcess(request, response);
	
	}
	

	private void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// �쎒釉뚮씪�슦���쓽 二쇱냼 �엯�젰李쎌뿉�꽌 
		// http://localhost:9090/MyMVC/member/idDuplicateCheck.up?userid=leess �� 媛숈씠 �엯�젰�릺�뿀�뜑�씪硫�
		// String url =  request.getRequestURL().toString();
		// System.out.println("~~~ �솗�씤�슜 url => " + url);
		// ~~~ �솗�씤�슜 url => http://localhost:9090/MyMVC/member/idDuplicateCheck.up
		
		String uri = request.getRequestURI();
		// System.out.println("~~~ �솗�씤�슜 uri => " + uri);
		// ~~~ �솗�씤�슜 uri => /MyMVC/member/idDuplicateCheck.up
		
		String ctxPath = request.getContextPath();
		// System.out.println("~~~ �솗�씤�슜 ctxPath => " + ctxPath);
		// ~~~ �솗�씤�슜 ctxPath => /MyMVC
		
		String key = uri.substring(ctxPath.length());
		// System.out.println("~~~ �솗�씤�슜 key => " + key);
		// ~~~ �솗�씤�슜 key => /member/idDuplicateCheck.up
		
		AbstractController action =  (AbstractController) cmdMap.get(key);
		// �떎�삎�꽦
		
		if(action == null) {
			System.out.println(">>> " + key + " URL �뙣�꽩�뿉 留ㅽ븨�맂 �겢�옒�뒪�뒗 �뾾�뒿�땲�떎.");
		}
		else {
			try {
				action.execute(request, response);
				
				boolean bool = action.isRedirect();
				String viewPage = action.getViewPage();
				
				if(!bool) {
					// bool �씠 false �씠硫�
					// viewPage �뿉 紐낃린�맂 view�떒 �럹�씠吏�濡� forward(dispatcher)瑜� �븯寃좊떎�뒗 留먯씠�떎.
					// forward �릺�뼱吏�硫� �쎒釉뚮씪�슦���쓽 URL二쇱냼 蹂�寃쎈릺吏� �븡怨� 洹몃�濡� �씠硫댁꽌 �솕硫댁뿉 蹂댁뿬吏��뒗 �궡�슜�� forward �릺�뼱吏��뒗 jsp �뙆�씪�씠�떎.
					// �삉�븳 forward 諛⑹떇�� forward �릺�뼱吏��뒗 �럹�씠吏�濡� �뜲�씠�꽣瑜� �쟾�떖�븷 �닔 �엳�떎�뒗 寃껋씠�떎. 

					if(viewPage != null) {
						RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
						dispatcher.forward(request, response);
					}
				}
				else {
					// bool �씠 true �씠硫�
					// viewPage �뿉 紐낃린�맂 二쇱냼濡� sendRedirect(�쎒釉뚮씪�슦���쓽 URL二쇱냼 蹂�寃쎈맖)瑜� �븯寃좊떎�뒗 留먯씠�떎.
					// 利�, �떒�닚�엳 �럹�씠吏��씠�룞�쓣 �븯寃좊떎�뒗 留먯씠�떎. 
					// �븫湲고븷 �궡�슜�� sendRedirect 諛⑹떇�� sendRedirect �릺�뼱吏��뒗 �럹�씠吏�濡� �뜲�씠�꽣瑜� �쟾�떖�븷 �닔媛� �뾾�떎�뒗 寃껋씠�떎. 
					if(viewPage != null) {
						response.sendRedirect(viewPage);
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end of if~else 
		
	} // end of private void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	
}
