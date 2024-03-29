<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.CommentVo" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArticleVo vo = (ArticleVo) request.getAttribute("vo");
    ArrayList<CommentVo> cList = (ArrayList<CommentVo>) request.getAttribute("comment");
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    String nowPage = request.getParameter("pn");
    String filter = request.getParameter("filter");
    String keyword = request.getParameter("keyword");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/detail.css">
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="detail-container">
    <aside>
        <div class="aside-container">
            <div class="svg-circle btnLike" id="btnLike">
                <svg class="like-svg" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M18 1l-6 4-6-4-6 5v7l12 10 12-10v-7z"></path>
                </svg>
            </div>
            <div class="like-count">
                <span class="likeCt"></span>
            </div>
        </div>
    </aside>
    <hr>
    <div class="detail-title">
        <h2 class="title-h2"><%=vo.getTitle()%>
        </h2>
    </div>
    <hr>
    <div class="detail-userInfo">
        <div class="pull-left">
            <div class="board-profileImg-section">
                <img class="board-profileImg" src="../resources/img/<%=vo.getNewFileName()%>" alt=""/>
            </div>
            <div class="pull-left-right">
                <p class="userName"><%=vo.getNickname()%>
                </p>
                <P><%=vo.getWriteDate().substring(0, 16)%>
                </P>
            </div>
        </div>
        <div class="pull-right">
            <div class="content-count">
                <div class="detail-content">
                    <div class="mobile-like-count">
                        <button id="like-btn" class="mobile-like-button btnLike">
                            <svg width="24" height="24" viewBox="0 0 24 24">
                                <path fill="currentColor" d="M18 1l-6 4-6-4-6 5v7l12 10 12-10v-7z"></path>
                            </svg>
                            <span class="likeCt"></span>
                        </button>
                    </div>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22 22">
                    <defs>
                        <clipPath>
                            <rect y="8" x="8" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect width="32" height="32" x="8" y="8" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="8" x="8" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <path d="m0 706.47h1490.93v-706.47h-1490.93v706.47"/>
                        </clipPath>
                        <clipPath>
                            <path d="m22.2 686.12h1447.73v-667.19h-1447.73v667.19"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                        <clipPath>
                            <rect y="8" x="8" height="32" width="32" fill="none" rx="16"/>
                        </clipPath>
                    </defs>
                    <path d="m740.86 187.66c0-12.912 12.526-23.416 27.922-23.416 15.397 0 27.923 10.505 27.923 23.416 0 12.912-12.526 23.416-27.923 23.416-1.295 0-2.594-.075-3.871-.223-5.93 3.767-10.308 5.829-13.02 6.131-.094.001-.189.016-.282.016-.872 0-1.678-.434-2.159-1.163-.537-.815-.572-1.848-.094-2.692.022-.04 2.116-3.861 1.512-7.51-6.37-4.458-10.01-10.973-10.01-17.975"
                          fill="#4d4d4d" transform="matrix(.30328 0 0 .30328-222.16-46.812)"/>
                </svg>
                <%=vo.getComment_count()%>
            </div>
            <div class="content-count">
                <svg version="1.1" fill-rule="evenodd" stroke-linejoin="bevel" viewBox="0 0 600 300" stroke-width=".501"
                     overflow="visible">
                    <g id="Document" font-size="16" transform="scale(1 -1)" stroke="black" font-family="Times New Roman"
                       fill="none">
                        <g id="Spread" transform="translate(0 -300)">
                            <g id="Layer 1">
                                <g id="Group" stroke="none" stroke-miterlimit="79.84">
                                    <g id="Group_1">
                                        <path stroke-linejoin="miter"
                                              d="m157.58 264.21c65.49 0 118.64-53.15 118.64-118.64 0-65.485-53.15-118.64-118.64-118.64-65.486 0.004-118.64 53.155-118.64 118.64 0.003 65.49 53.154 118.64 118.64 118.64z"
                                              stroke-width="8" fill="#ffffff"/>
                                        <path d="m157.58 18.753c-70.006 0-126.82 56.812-126.82 126.82 0.003 70.01 56.814 126.82 126.82 126.82 70 0 126.82-56.81 126.82-126.82 0-70.005-56.82-126.82-126.82-126.82zm0 16.361c60.97 0 110.46 49.488 110.46 110.46 0 60.97-49.49 110.46-110.46 110.46-60.969 0-110.46-49.49-110.46-110.46 0.003-60.968 49.491-110.46 110.46-110.46z"
                                              fill-rule="evenodd" stroke-width=".5" fill="#000000"/>
                                        <g id="Group_2" stroke-linejoin="miter" stroke-width=".5">
                                            <path d="m200.39 196.72c26.81 0 48.57-21.76 48.57-48.56 0-26.81-21.76-48.565-48.57-48.565-26.8 0-48.56 21.755-48.56 48.565 0 26.8 21.76 48.56 48.56 48.56z"
                                                  fill="#000000"/>
                                            <g id="Group_3" fill="#ffffff">
                                                <path d="m221.62 175.92c-6.82 0-12.36-5.54-12.36-12.37 0-6.82 5.54-12.36 12.36-12.36s12.36 5.54 12.36 12.36c0 6.83-5.54 12.37-12.36 12.37z"/>
                                            </g>
                                        </g>
                                    </g>
                                    <g id="Group_4">
                                        <path stroke-linejoin="miter"
                                              d="m433.47 263.17c65.49 0 118.64-53.15 118.64-118.63 0-65.492-53.15-118.64-118.64-118.64-65.48-0.003-118.63 53.148-118.63 118.64 0 65.48 53.15 118.63 118.63 118.63z"
                                              stroke-width="8" fill="#ffffff"/>
                                        <path d="m433.47 17.716c-70 0-126.81 56.812-126.81 126.82 0 70 56.81 126.81 126.81 126.81 70.01 0 126.82-56.81 126.82-126.81 0-70.012-56.81-126.82-126.82-126.82zm0 16.361c60.97 0 110.46 49.488 110.46 110.46 0 60.96-49.49 110.45-110.46 110.45s-110.45-49.49-110.45-110.45c0-60.975 49.48-110.46 110.45-110.46z"
                                              fill-rule="evenodd" stroke-width=".5" fill="#000000"/>
                                        <g id="Group_5" stroke-linejoin="miter" stroke-width=".5">
                                            <path d="m476.28 195.69c26.81 0 48.57-21.76 48.57-48.57 0-26.8-21.76-48.562-48.57-48.562-26.8 0-48.56 21.762-48.56 48.562 0 26.81 21.76 48.57 48.56 48.57z"
                                                  fill="#000000"/>
                                            <g id="Group_6" fill="#ffffff">
                                                <path d="m497.51 174.88c-6.82 0-12.36-5.54-12.36-12.36 0-6.83 5.54-12.37 12.36-12.37 6.83 0 12.37 5.54 12.37 12.37 0 6.82-5.54 12.36-12.37 12.36z"/>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </svg>
                <%=vo.getHit()%>
            </div>
        </div>
    </div>
</div>
<div class="detail-dec">
    <p><%=vo.getContent()%>
    </p>
</div>
</div>

<div class="detail-button">
    <%
        if (id != null) {   //id있을때
            if (id.equals(vo.getId())) {    //글 작성자랑 로그인id랑 같을때
    %>
    <div class="left-button">
        <button onclick="
                location.href='/freeUpdate.do?pn=<%=nowPage%>&num=<%=vo.getB_sq()%>&filter=<%=filter%>&keyword=<%=keyword%>'">
            수정
        </button>
        <button onclick="articleDelete()">삭제</button>
    </div>
    <div class="right-button">
        <button onclick="
                location.href='/freeBoard.do?pn=<%=nowPage%>&filter=' + '<%=filter%>' + '&keyword=' + '<%=keyword%>'">목록
        </button>
    </div>
    <%--id 있는데 게시글 번호랑 다를때--%>
    <% } else { %>
    <div class="right-button">
        <button onclick="
                location.href='/freeBoard.do?pn=<%=nowPage%>&filter=' + '<%=filter%>' + '&keyword=' + '<%=keyword%>'">목록
        </button>
    </div>
    <%--id==null일 때--%>
    <% }
    } else { %>
    <div class="right-button">
        <button onclick="
                location.href='/freeBoard.do?pn=<%=nowPage%>&filter=' + '<%=filter%>' + '&keyword=' + '<%=keyword%>'">목록
        </button>
    </div>
    <% } %>
</div>
<div class="comment-container">
    <div class="comment-count">
        <h4>Comments <%=vo.getComment_count()%>
        </h4>
    </div>
    <%
        for (int i = 0; i < cList.size(); i++) {
    %>
    <table>
        <%--댓글 내용 부분--%>
        <tbody class="cmt-content<%=cList.get(i).getCm_sq()%>">
        <tr class="left-section">
            <td class="left-info-img">
                <img class="board-profileImg" src="../resources/img/<%=cList.get(i).getNewFileName()%>" alt=""/>
            </td>
            <td class="left-info-nick"><%=cList.get(i).getNickname()%>
            </td>
            <td class="left-info-date"><%=cList.get(i).getWriteDate().substring(0, 16)%>
            </td>
        </tr>
        <tr class="right-section">
            <%
                if (id != null) {
            %>
            <td class="right-info"><a href="#">답변</a></td>
            <%
                if (id.equals(cList.get(i).getId())) {
            %>
            <td class="right-info" onclick="showModify(<%=cList.get(i).getCm_sq()%>)" style="cursor: pointer">
                <a>수정</a></td>
            <td class="right-info">
                <a onclick="commentDelete(<%=cList.get(i).getCm_sq()%>,'<%=cList.get(i).getId()%>')">삭제</a>
                <% }
                } %>
            </td>
        </tr>
        </tbody>
        <tbody>
        <tr class="cmt-content<%=cList.get(i).getCm_sq()%>">
            <td class="cmt-content"><%=cList.get(i).getContent()%>
            </td>
        </tr>
        </tbody>
        <%----------------%>
        <tfoot>
        <%--댓글 수정창--%>
        <div class="fix-comment-hidden<%=cList.get(i).getCm_sq()%>" style="display: none">
            <div class="fix-comment-txt">
                <textarea id="modifyContent<%=cList.get(i).getCm_sq()%>" name="modifyContent"
                          placeholder="여러분의 소중한 댓글을 입력해주세요."><%=cList.get(i).getContent()%></textarea>
            </div>
            <div class="fix-comment-button">
                <button class="fix-CmtBtn-cancel" onclick="cancleModify(<%=cList.get(i).getCm_sq()%>)">취소</button>
                <button class="fix-CmtBtn tabActive<%=cList.get(i).getCm_sq()%>"
                        onclick="modifyComment(<%=cList.get(i).getCm_sq()%>)">수정하기</button>
            </div>
        </div>
        <%-------------------------%>
        </tfoot>

        <% } %>
    </table>
    <% if (id != null) {  //로그인 세션있을때만 %>
    <div>
        <div class="comment-txt">
            <textarea id="content" name="content"
                      placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
        </div>
        <div class="comment-button">
            <button id="go-bottom" name="go-bottem" onclick="commentSubmit()">댓글달기</button>
        </div>
    </div>
    <% } %>
</div>
<script>
    toastr.options = {
        "closeButton": true,
        "positionClass": "toast-top-center",
        "timeOut": 1000
    }

    $(function () {
        //좋아요 클릭 시 이전 좋아요 기록 여부 확인
        $(".btnLike").click(function () {
            <%
                if (id==null){
            %>
            toastr.error("로그인이 필요합니다.");
            location.href = '/login.do';
            <%
                }else {
            %>
            $.ajax({
                url: "/recUpdate.ajax",
                type: "post",
                data: {
                    num: '<%=vo.getB_sq()%>'
                },
                error: function () {
                },
                success: function () {
                    recCount();
                },
            })
            <% }  %>
        });

        // 게시글 추천수
        function recCount() {
            $.ajax({
                url: "/recCount.ajax"
                , type: "post"
                , data: {
                    num: '<%=vo.getB_sq()%>'
                }
                , error: function () {
                }
                , success: function (data) {

                    let JsonData = JSON.parse(data);

                    $(".likeCt").html(JsonData.count);  //총 추천수 보이게
                    if (JsonData.onOff == 0) { //전달받은 0은 아직 추천하지 않았을경우
                        $(".btnLike svg").css("color", "rgb(134, 142, 150)")
                    } else {//내가 추천해 놓은 경우
                        $(".btnLike svg").css("color", "#FFA7A7")
                    }
                },
            })
        };
        recCount();
    })

    function articleDelete() {
        if (confirm('삭제하시겠습니까?') == true) {
            location.href = '/freeDelete.do?pn=<%=nowPage%>&num=<%=vo.getB_sq()%>&filter=<%=filter%>&keyword=<%=keyword%>';
        } else {
            return;
        }
    }

    function commentSubmit() {
        var content = $('#content').val();
        if (!content) {
            toastr.error("댓글을 입력하세요");
            $('#content').focus();
            return false;
        }

        $.ajax({
            url: "/addComment.ajax"
            , type: "post"
            , data: {
                num: '<%=vo.getB_sq()%>',
                content: content
            }
            , dataType: "json"
            , error: function (xhr, request, status) {
                console.log("서버 통신 실패");
                console.log(status);
            }
            , success: function (data) {
                console.log("서버 통신 성공");
                if (data.count > 0) {      //0이상이면 지워짐
                    console.log(data + "success 등록 성공" + data.count);
                    location.reload();  //페이지 리로드
                } else {
                    console.log(data + "success else result = " + data.count);
                }
            }
        });
    }

    function commentDelete(num, commentId) {
        //로그인 id,댓글 id비교해야 함.
        var id = '<%=id%>';   //로그인 되어있는 id
        console.log('login id: <%=id%>' + ' | comment id: ' + commentId);

        if (confirm('삭제하시겠습니까?') == true) {    //확인눌렀을 때

            if (id == commentId) {
                $.ajax({
                    url: "/delComment.ajax"
                    , type: "post"
                    , data: {commentNum: num}
                    , dataType: "json"
                    , error: function (xhr, request, status) {
                        console.log("서버 통신 실패");
                        console.log(status);
                    }
                    , success: function (data) {
                        console.log("서버 통신 성공");

                        if (data.count > 0) {      //0이상이면 지워짐
                            console.log(data + "success 삭제 성공" + data.count);
                            location.reload();  //페이지 리로드
                        } else {
                            console.log(data + "success else result = " + data.count);
                        }
                    }
                });
            } else {  //작성자와 접속자다르거나 로그아웃일 때
                toastr.error("권한이 없습니다.");
                return false;
            }
        } else {      //confirm에서 취소눌렀을 때
            return false;
        }
    }

    //수정 창으로 변환
    function showModify(num) {
        $('.cmt-content' + num).hide();
        $('.fix-comment-hidden' + num).show();
    }

    //수정 취소
    function cancleModify(num){
        $('.cmt-content' + num).show();
        $('.fix-comment-hidden' + num).hide();
    }

    //댓글 수정
    function modifyComment(num) {
        var content = $('#modifyContent'+num).val();
        console.log(content);

        if (!content) {
            toastr.error("수정할 내용을 입력하세요");
            $('#modifyContent').focus();
            return false;
        }

        $.ajax({
            url: "/modifyComment.ajax"
            , type: "post"
            , data: {
                num: num,
                content: content
            }
            , dataType :"json"
            , error: function (xhr, request, status) {
                console.log("서버 통신 실패");
                console.log(status);
            }
            , success: function (data) {
                console.log("서버 통신 성공");
                if (data.count > 0) {      //0이상이면 수정됨
                    console.log(data + "success 등록 성공" + data.count);
                    location.reload();  //페이지 리로드
                } else {
                    console.log(data + "success else result = " + data.count);
                }
            }
        });
    }
</script>
<script type="text/javascript">
    $(function () {
        $('#content').keydown(function (key) {
            if (key.keyCode == 13) {
                commentSubmit();
                $('#content').focus();
            }
        });

    })
</script>
</body>
</html>