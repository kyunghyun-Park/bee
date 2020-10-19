package com.bee.www.action.Member;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.RegExp;
import com.bee.www.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.MEMBER_EMAIL;

public class AjaxCheckEmailAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) throws IOException {

        String email = request.getParameter("email"); //join or profile jsp에서 id받아옴

        //id 유효성 검사
        if(email==null||email.equals("")||!RegExp.checkString(MEMBER_EMAIL,email)){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다');history.back();</script>");
            out.close();
            return null;
        }

        MemberService service = new MemberService();
        //0이면 미중복 1이면 중복
        request.setAttribute("count", service.emailCheck(email));

//        if(!service.idCheck(id)){ //service 호출(아이디 중복시)
//            request.setAttribute("count", 1);
//            response.setContentType("text/html;charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.println("<script>alert('사용할 수 없는 아이디입니다.');location.href='/idCheckForm.do';</script>");
//            out.close();
//            return null;
//        }

        ActionForward forward = new ActionForward();
        forward.setPath("/views/ajax/AjaxCheckJoin.jsp");
        return forward;
    }
}
