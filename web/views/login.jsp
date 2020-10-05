<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <header>
        <div class="header-area">
            <div class="header-main">
                <div class="logo">
                    <a href="index.jsp">
                        <h3>Good Bee</h3>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="back-container2">
            <div class="back-img2">
                <div class="main-container">
                    <div class="main-padding">
                        <div class="main-section">
                            <section class="container">
                                <article class="modal">
                                    <a href="index.jsp"><div class="exit-wrapper">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" tabindex="1" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                                        </svg>
                                    </div></a>
                                    <div class="tabs">
                                      <span class="tab signin active"><a href="/login.do">로그인</a></span>
                                      <span class="tab signup"><a href="/join.do">회원가입</a></span>
                                    </div>
                                    <div class="content">
                                        <section class="signin-cont cont">
                                            <form>
                                                <input id="id" type="text" class="inpt" placeholder="Your Id" style="margin-bottom: 25px;"/>
                                                <input id="pw" type="password" class="inpt" placeholder="Your Password" style="margin-bottom: 25px;"/>
                                                <h4>forget your Id ?
                                                    <br/><a href="#">클릭</a>
                                                </h4>
                                                <div class="submit-wrap">
                                                    <input type="submit" value="로그인" class="submit"/>
                                                </div>
                                            </form>
                                        </section>
                                    </div>
                                </article>
                              </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>