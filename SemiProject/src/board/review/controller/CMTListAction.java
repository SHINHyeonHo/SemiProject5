package board.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;
import board.review.model.*;
import common.controller.AbstractController;

public class CMTListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		int fk_rev_no = Integer.parseInt(request.getParameter("fk_rev_no"));

		InterBoardDAO bao = new BoardDAO();
		JSONArray jsArr = new JSONArray();

		List<CommentVO> cmtList = bao.getCMTList(fk_rev_no);

		if (cmtList != null) {
			for (CommentVO cvo : cmtList) {
				JSONObject jsobj = new JSONObject();
				jsobj.put("cmt_content", cvo.getCmt_content());
				jsobj.put("fk_cmt_userid", cvo.getFk_cmt_userid());
				jsobj.put("cmt_write_date", cvo.getCmt_write_date());
				jsobj.put("cmt_no", cvo.getCmt_no());

				jsArr.put(jsobj);
			}
		}

		String json = jsArr.toString();
		request.setAttribute("json", json);

		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");

	}

}
