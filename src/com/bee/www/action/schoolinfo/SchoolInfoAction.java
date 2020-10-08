package com.bee.www.action.schoolinfo;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.service.BoardService;
import com.bee.www.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class SchoolInfoAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {
        BoardService service = new BoardService();
        ActionForward forward = new ActionForward();
        String query="c_sq BETWEEN 1 AND 6";

        ArrayList<ArticleVo> articleList = service.getArticleList(query);

        request.setAttribute("list",articleList);

        forward.setPath("/views/schoolInfo.jsp");
        return forward;
    }
}
