package com.bee.www.action.schoolinfo;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardRecUpdateAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        // no와 id값을 map에 저장
        int num = Integer.parseInt(request.getParameter("num"));

        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());
        BoardService service = new BoardService();

        if(service.recCheck(num, id)){
            service.recUpdate(num, id); //추천 아직안했음
        }else{
            service.recDelete(num, id); //추천 했음 삭제 ㄱㄱ
        }
        return null;
    }
}
