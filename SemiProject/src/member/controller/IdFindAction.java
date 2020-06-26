package member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class IdFindAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      String method = request.getMethod();
      // 데이터 전송 방식이 GET or POST인지 확인 !
<<<<<<< HEAD
      System.out.println("확인용 method 방식 : " +method);
=======
      
>>>>>>> refs/heads/master
      if("POST".equalsIgnoreCase(method)) {
         
         String name = request.getParameter("name");
         String mobile = request.getParameter("mobile");
         
         InterMemberDAO memberdao = new MemberDAO();
         
         HashMap<String, String> paraMap = new HashMap<>();
         paraMap.put("name", name);
         paraMap.put("mobile", mobile);
         
         String userid = memberdao.finduserid(paraMap);
         
         if(userid != null) {
            request.setAttribute("userid", userid);
         }
         
         else {
            request.setAttribute("userid", "존재하지 않습니다.");
         }
         
         request.setAttribute("name", name);
         request.setAttribute("mobile", mobile);
         
      } // end of if
      
      request.setAttribute("method", method);
      
      // super.setRedirect(false);
      super.setViewPage("/WEB-INF/habibi/member/idFind.jsp");
      
      
      
      
      
   }

}