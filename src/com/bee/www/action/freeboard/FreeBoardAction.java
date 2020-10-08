package com.bee.www.action.freeboard;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.service.BoardService;
import com.bee.www.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class FreeBoardAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {
        BoardService service = new BoardService();
        String query="c_sq=7";

        ArrayList<ArticleVo> articleList = service.getArticleList(query);
        request.setAttribute("list",articleList);

        ActionForward forward = new ActionForward();

        forward.setPath("/views/freeBoard.jsp");
        return forward;
    }
}
