<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-22
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.memberVO" %>
<%@ page import="gntp.model2.lesson1.util.DateTimeService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>List</title>
    <!-- 스타일시트 연결 -->
    <link rel="stylesheet" href="CSS/list.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

</head>
<body>

<%
    // 보낸 값 받기 getAttribute  // 오브젝트를 ArrayList 로 변경
    ArrayList<memberVO> list = (ArrayList<memberVO>) request.getAttribute("list");
    //out.println(list.size());

    DateTimeService T = new DateTimeService();


    // 가입일자가 날짜만 나오도록 수정
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
            <li>
                <a href="MyServlet?command=Home">
                    <button> Home</button>
                </a>
            </li>
        </ul>
    </nav>
    <article>
        <div id="Main_Box">
            <h1> 회원 리스트 </h1>
            <table id="list_table">
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th colspan="2"> 버튼</th>
                </tr>
                <%
                    for (memberVO vo : list) {
                %>
                <tr>
                    <td>
                        <a href="MyServlet?command=read&id=<%=vo.getId()%>">
                            <%=vo.getId()%>
                        </a>
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
                    <td>
                        <a href="MyServlet?command=Update&id=<%=vo.getId()%>">
                            <button>변경하기</button>
                        </a>
                    </td>
                    <td>
                        <a href="MyServlet?command=delete&id=<%=vo.getId()%>">
                            <button>삭제하기</button>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
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
