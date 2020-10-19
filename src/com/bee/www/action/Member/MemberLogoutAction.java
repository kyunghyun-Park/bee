package com.bee.www.action.Member;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.MemberService;
import com.bee.www.vo.MemberVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();
        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(session);

        if (id != null) {
            lm.removeSession(id); //세션뺏음,로그아웃 처리
        }
        
        //메인페이지로 이동
        ActionForward forward = new ActionForward();
        forward.setPath("/");
        forward.setRedirect(true);
        return forward;
    }

    public void logoutProc(String id){
        MemberVo memberVo = new MemberVo();
        memberVo.setId(id);     //vo에 로그아웃할 id담음
        memberVo.setLgn_fl(false);  //vo에 로그아웃 상태로 변경

        MemberService service = new MemberService();
        if(!service.logoutMember(memberVo)){
            System.out.println(id + "회원의 로그아웃 처리에 실패하였습니다.");
        }
    }
}
