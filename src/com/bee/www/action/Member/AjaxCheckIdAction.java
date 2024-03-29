package com.bee.www.action.Member;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.RegExp;
import com.bee.www.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.MEMBER_ID;

public class AjaxCheckIdAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = request.getParameter("id"); //join.jsp에서 id받아옴

        //id 유효성 검사
        if(id==null||id.equals("")||!RegExp.checkString(MEMBER_ID,id)){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다');history.back();</script>");
            out.close();
            return null;
        }

        MemberService service = new MemberService();
        //0이면 미중복 1이면 중복
        request.setAttribute("count", service.idCheck(id));

        ActionForward forward = new ActionForward();
        forward.setPath("/views/ajax/AjaxCheckJoin.jsp");
        return forward;
    }
}
