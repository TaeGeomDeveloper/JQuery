<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-22
  Time: 오후 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="gntp.model2.lesson1.MyServlet" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.memberVO" %>
<%@ page import="dao.memberDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>

    <!-- 스타일시트 연결 -->
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>
</head>
<body>
<%

    MyServlet ms = new MyServlet();

//    ArrayList<memberVO> list = ms.getMember();
//
//    // 보내기 setAttribute
//    request.setAttribute("list",list);
%>

<%--헤더--%>
<header>
    회원 정보 관리 시스템
</header>

<%--네비--%>
<ul>
    <li><a class="active" href="#home">Home</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#about">About</a></li>
</ul>

<%--몸통--%>
<section>
    <nav>
        <ul>
            <li>
                <a href="MyServlet?command=list"><button> 리스트 불러오기 </button></a>
            </li>
            <li>
                <a href="MyServlet?command=Insert"><button> 회원 가입하기 </button></a>
            </li>
            <li>
                <a href="MyServlet?command=BookList"><button> 도서 목록 </button></a>
            </li>
        </ul>

    </nav>
    <article>
        <div id="Main_Box">

        </div>
    </article>
</section>

<%--푸터--%>
<footer>
    <p>Footer</p>
</footer>

</body>
</html>
