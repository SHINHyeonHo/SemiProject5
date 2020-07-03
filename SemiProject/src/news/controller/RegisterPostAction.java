package news.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import news.model.InterNewsDAO;
import news.model.NewsDAO;
import news.model.NewsVO;


public class RegisterPostAction extends AbstractController {
	
	//form으로 받아온 데이터 처리하는 곳 . 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest mutiRequest = null;
		HttpSession session = request.getSession();
		
		ServletContext svlCtx = session.getServletContext();
		String imagesDir = svlCtx.getRealPath("/images/Post");
		System.out.println(imagesDir);
		try {	
			  mutiRequest = new MultipartRequest(request, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
			
	      } catch(IOException e) {
	    	  request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
	    	  request.setAttribute("loc", request.getContextPath()+"/news/writePost.hb"); 
	    	  super.setViewPage("/WEB-INF/habibi/news/writePost.jsp");
	    	  return;
		  }
		
		String title = mutiRequest.getParameter("title");
		String writer = mutiRequest.getParameter("writer");
	    String content = mutiRequest.getParameter("content");
		String file = mutiRequest.getFilesystemName("file");
		//System.out.println("prodImage : "+prodImage);
		
		
	   NewsVO nvo=new NewsVO();
	   
	   nvo.setNews_title(title);
	   nvo.setNews_writer(writer);
	   nvo.setNews_content(content);
	   nvo.setFiles(file);
	    
		InterNewsDAO ndao = new NewsDAO();
		
	    int result = ndao.registerPost(nvo);
	    
	    super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/news/register.jsp");
	   
		
	}


	}

	
	

