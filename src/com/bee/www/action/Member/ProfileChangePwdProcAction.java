package com.bee.www.action.Member;

import com.bee.www.common.*;
import com.bee.www.service.BoardService;
import com.bee.www.service.MemberService;
import com.bee.www.vo.MemberVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.MEMBER_PWD;

public class ProfileChangePwdProcAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());
        if(id == null) {
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>alert('로그인이 필요한 서비스 입니다.');location.href='/login.do';</script>");
            out.close();
            return null;
        }
        String pwd=request.getParameter("pwd");
        String pwd_confirm=request.getParameter("pwd_confirm");
        if (pwd == null || pwd.equals("")
                || !RegExp.checkString(MEMBER_PWD, pwd)) {
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>alert('잘못된 접근입니다.');location.href='/';</script>");
            out.close();
            return null;
        }

        if (!pwd.equals(pwd_confirm)) {
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>alert('잘못된 접근입니다.');location.href='/';</script>");
            out.close();
            return null;
        }

        MemberService service = new MemberService();
        //vo에 담음
        MemberVo vo = new MemberVo();
        vo.setId(id);   //로그인된 id값 담기
        vo.setPwd(BCrypt.hashpw(pwd,BCrypt.gensalt(12))); //비번 암호화해서 담기

        if(!service.changePwd(vo)){ //실패
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>alert('비밀번호 변경에 실패했습니다.');history.back();</script>");
            out.close();
            return null;
        }else{  //성공
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>alert('비밀번호 변경 완료');location.href='/';</script>");
            out.close();
        }

        ActionForward forward = new ActionForward();
        forward.setPath("/");
        forward.setRedirect(true);
        return forward;
    }
}
