package admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import admin.member.model.AdminMemberDAO;
import admin.member.model.InterAdminMemberDAO;
import common.controller.AbstractController;
import member.model.MemberVO;

public class SearchMemberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String searchType=request.getParameter("searchType");
		String searchWord=request.getParameter("searchWord");
		
		System.out.println(searchType);
		System.out.println(searchWord);
		
		
		//searchType,searchWord 조건에 맞는 db 데이터 불러오기 
		
		InterAdminMemberDAO mdao=new AdminMemberDAO();//db에서 불러와야하니 dao 객체 생성
		List<MemberVO> memberList=mdao.getMemberInfo(searchType,searchWord);
		//파라미터에 맞는 데이터만 불러오는 메소드 실행, 복수의 행: List 로 받기, return값:object-> MemberVO로 casting (getter,setter 사용하려고)
		
		JSONArray jsArr = new JSONArray();
		
		if(memberList!=null) {//행이 있다면
			 for(MemberVO mvo:memberList) {//memberList 행들을 처음부터 끝까지 MemberVO형태인 mvo로 반복해서 꺼내겠다는 것. 
				 
				 JSONObject jsObj = new JSONObject();//이 오브젝트에 넣어 
				 
				 jsObj.put("userid", mvo.getUserid());
				 jsObj.put("name", mvo.getName());
				 jsObj.put("email",mvo.getEmail());
				 jsObj.put("address1", mvo.getAddress1());
				 jsObj.put("address2", mvo.getAddress2());
				 jsObj.put("mobile1", mvo.getMobile1());
				 jsObj.put("mobile2", mvo.getMobile2());
				 jsObj.put("mobile3", mvo.getMobile3());
				 jsObj.put("is_sms", mvo.getIs_sms());
				 jsObj.put("is_email", mvo.getIs_email());
				 jsObj.put("point", mvo.getPoint());
				 jsObj.put("is_member",mvo.getIs_member());
				 jsObj.put("join_date",mvo.getJoin_date());
				 jsObj.put("last_passwd_date",mvo.getLast_passwd_date());
				 jsObj.put("last_login_date",mvo.getLast_login_date());
				 
				 jsArr.put(jsObj);

				 
			 }//end of for---
			 
		}//end of if----
		
		String json=jsArr.toString();
		request.setAttribute("json", json);
		
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
	}
  
}
