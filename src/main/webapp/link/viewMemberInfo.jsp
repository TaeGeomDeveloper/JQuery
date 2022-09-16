<%@ page import="vo.memberVO" %><%--
  Created by IntelliJ IDEA.
  User: 윤태검
  Date: 2022-09-01
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberInfo</title>

    <link rel="stylesheet" href="CSS/m_list.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

</head>
<body>
<%
    // 보낸 값 받기 getAttribute  // 오브젝트를 memberVO 로 변경
    memberVO vo = (memberVO) request.getAttribute("member");
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
                <a href="MyServlet?command=list">
                    <button> 리스트 불러오기</button>
                </a>
            </li>
            <li>
                <a href="MyServlet?command=Insert">
                    <button> 회원 가입하기</button>
                </a>
            </li>
        </ul>
    </nav>
    <article>
        <div id="Main_Box">
            <h1> 개별 회원 정보 </h1>

            <table id="member_table">
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>가입일</th>
                </tr>
                <tr>
                    <td>
                        <%=vo.getId()%>
                    </td>
                    <td>
                        <%=vo.getPwd()%>
                    </td>
                    <td>
                        <%=vo.getName()%>
                    </td>
                    <td>
                        <%=vo.getEmail()%>
                    </td>
                    <td>
                        <%=vo.getJoinDate()%>
                    </td>
                </tr>
            </table>
        </div>
    </article>
</section>

<%--푸터--%>
<footer>
    <p>Footer</p>
</footer>

</body>
</html>
