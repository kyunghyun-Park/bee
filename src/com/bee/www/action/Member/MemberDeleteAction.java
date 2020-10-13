package com.bee.www.action.Member;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MemberDeleteAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());

        //로그인 안돼있을때
        if (id == null) {
            out.println("<script>alert('로그인이 필요한 서비스 입니다.');location.href='/login.do';</script>");
            out.close();
            return null;
        }

        if (id != null) {
            lm.removeSession(id); //세션뺏음,로그아웃 처리
        }
        BoardService service = new BoardService();
        if (!service.deleteMember(id)) {
            out.println("<script>alert('회원탈퇴에 실패했습니다.');history.back();</script>");
            out.close();
            return null;
        }

        out.println("<script>alert('굿바이');</script>");
        out.close();
        //메인페이지로 이동
        ActionForward forward = new ActionForward();
        forward.setPath("/");
        forward.setRedirect(true);
        return forward;
    }
}
