package com.bee.www.action.schoolinfo;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.Pagenation;
import com.bee.www.common.RegExp;
import com.bee.www.service.BoardService;
import com.bee.www.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import static com.bee.www.common.RegExp.IS_NUMBER;

public class SchoolInfoAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) throws IOException {
        String query = "c_sq BETWEEN 1 AND 6";  //지역번호 카테고리 번호 쿼리에 미리 저장

        String pageNum = request.getParameter("pn");  //페이지 번호 받아오기
        if (pageNum == null     //페이지 번호 숫자 아닐때
                || !RegExp.checkString(IS_NUMBER, pageNum)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');location.href='/';</script>");
            out.close();
            return null;
        }

        int page = Integer.parseInt(pageNum); //페이지 번호 정수형 변환
        if (page < 1) {     //페이지 번호 1보다 작을때 오류
            page = 1;
        }
        //검색,필터 받아와서 쿼리 생성
        String filter = request.getParameter("filter");     //전체 or 제목 or 내용
        String keyword = request.getParameter("keyword");   //검색 키워드
        String region = request.getParameter("region");     //지역 체크박스 값

        if (filter == null || filter.equals("")) {      //필터 값 없을 시 전체로 대입
            filter = "all";
        }
        if (keyword != null && !keyword.equals("")) {   //검색값에 뭔가가 들어와있으면 쿼리 생성
            query += makeSearchQuery(filter, keyword);
        }
        if(region!=null&&!region.equals("")){
            query= " c_sq ="+region;
        }

        BoardService service = new BoardService();

        //-------------------------페이징-------------------------------------
        //현재 페이지번호,총 글 개수구해서 계산하기
        Pagenation pagenation = new Pagenation(page, service.getArticleCount(query));
        //현재 페이지번호가 총 페이지 개수보다 크면 총 페이지개수 페이지로 이동
        if (page > pagenation.getTotalPageCount()) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>location.href='/schBoard.do?pn=" + pagenation.getTotalPageCount() +
                        "&filter=" + filter + "&keyword=" + keyword + "';</script>");
            out.close();
            return null;
        }

        ArrayList<ArticleVo> articleList = service.getArticleList(pagenation, query);
        //리스트에 지역이름 set하기
        for (int i = 0; i < articleList.size(); i++) {
            articleList.get(i).setCate_name(service.getCateName(articleList.get(i).getC_sq()));
        }

        //schoolInfo에 보내기
        ActionForward forward = new ActionForward();
        request.setAttribute("pagenation", pagenation);
        request.setAttribute("list", articleList);
        forward.setPath("/views/schoolInfo.jsp");
        return forward;
    }

    private String makeSearchQuery(String filter, String keyword) {
        String querySearch = null;
        if (filter.equals("all")) {              //전체 검색
            querySearch = " and (title like '%" + keyword
                    + "%' or content like '%" + keyword + "%')";
        } else if (filter.equals("title")) {     //제목 검색
            querySearch = " and (title like '%" + keyword + "%')";
        } else {                                //내용 검색
            querySearch = " and (content like '%" + keyword + "%')";
        }
        return querySearch;
    }
}
