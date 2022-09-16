<%@ page import="gntp.model2.lesson1.MyServlet" %>
<%@ page import="vo.BookVO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 윤태검
  Date: 2022-09-02
  Time: 오후 5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookList</title>

    <!-- 스타일시트 연결 -->
    <link rel="stylesheet" href="CSS/list.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

</head>
<body>

<%

    ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");

//    ArrayList<memberVO> list = ms.getMember();
//
//    // 보내기 setAttribute
//    request.setAttribute("list",list);

    // getParmeter 값 얻기

%>

<%
    request.setCharacterEncoding("UTF-8");
    // 보낸 값 받기 getAttribute  // 오브젝트를 memberVO 로 변경
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
            <h1> 도서 리스트 </h1>
            <table id="list_table">
                <tr>
                    <th>분류번호</th>
                    <th>도서명</th>
                    <th>저자</th>
                    <th>가격</th>
                    <th>구입일</th>
                    <th colspan="2"> 버튼</th>
                    <th> 대출 </th>
                </tr>
                <%
                    for (BookVO vo : list) {
                %>
                <tr>
                    <td>
                        <a href="MyServlet?command=read&id=<%=vo.getBookNo()%>">
                            <%=vo.getBookNo()%>
                        </a>
                    </td>
                    <td>
                        <%=vo.getBookName()%>
                    </td>
                    <td>
                        <%=vo.getAuthor()%>
                    </td>
                    <td>
                        <%=vo.getPrice()%>
                    </td>
                    <td>
                        <%=vo.getBuyDate()%>
                    </td>
                    <td>
                        <a href="MyServlet?command=Update&id=<%=vo.getBookNo()%>">
                            <button>변경하기</button>
                        </a>
                    </td>
                    <td>
                        <a href="MyServlet?command=delete&id=<%=vo.getBookNo()%>">
                            <button>삭제하기</button>
                        </a>
                    </td>
                    <td>
                        <input type="checkbox" name="choice">
                    </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="2" style="text-align:center; background-color: black; color: white;">
                        아이디
                    </td>
                    <td colspan="3" style="text-align:center; background-color: black; color: white;">
                        비밀번호
                    </td>
                    <td colspan="3" style="text-align:center; background-color: black; color: white;">
                        버튼
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center; background-color: black; color: white;">
                        <input type="text" name="id">
                    </td>
                    <td colspan="3" style="text-align:center; background-color: black; color: white;">
                        <input type="text" name="pwd">
                    </td>
                    <td colspan="3" style="text-align:center; background-color: black; color: white;">
                        <input type="button" value="대출하기" onclick="fn_sendMember()">
                        <input type="hidden" name="command" value="InsertMember"/>
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
