package admin.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import admin.qna.model.*;
import common.controller.AbstractController;

public class ListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String searchCategory = request.getParameter("searchCategory");
		String searchName = request.getParameter("searchName");
		int start = Integer.parseInt(request.getParameter("start"));
		int len = Integer.parseInt(request.getParameter("len"));
		int end = start + len - 1;
				
		InterBoardDAO bdao = new BoardDAO();
		
		List<BoardVO> qnaList = bdao.getQNAList(searchCategory, searchName, start, end);
		int count = bdao.getQNACount(searchCategory, searchName);
		int unANScnt = bdao.getANSCount(0);
		int ANScnt = bdao.getANSCount(1);
		
		JSONObject jsObj = new JSONObject();
		
		if(qnaList != null) {
			jsObj.put("qnaList", qnaList);
			jsObj.put("count", count);
			jsObj.put("unANScnt", unANScnt);
			jsObj.put("ANScnt", ANScnt);
		}
		
		request.setAttribute("json", jsObj);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
   
	}

}

