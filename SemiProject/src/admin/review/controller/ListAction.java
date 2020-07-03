package admin.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import admin.review.model.*;
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

		List<BoardVO> revList = bdao.getREVList(searchCategory, searchName, start, end);
		int count = bdao.getREVCount(searchCategory, searchName);
		int cnt = bdao.getNewREVCount();

		JSONObject jsObj = new JSONObject();

		if (revList != null) {
			jsObj.put("revList", revList);
			jsObj.put("count", count);
			jsObj.put("cnt", cnt);
		}

		request.setAttribute("json", jsObj);

		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");

	}

}
