<%@ page import="vo.GuestVO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 윤태검
  Date: 2022-09-05
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Guestbook List</title>

    <!-- 스타일시트 연결 -->
    <link rel="stylesheet" href="CSS/ListBook.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

</head>
<body>
  <%
      // 보낸 값 받기 getAttribute  // 오브젝트를 ArrayList 로 변경
      ArrayList<GuestVO> list = (ArrayList<GuestVO>) request.getAttribute("list");
      //out.println(list.size());


      // 가입일자가 날짜만 나오도록 수정
  %>

  <%--헤더--%>
  <header>
      Guestbook List
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
              <h1> 방명록 </h1>
              <table id="list_table">
                  <tr>
                      <th>아이디</th>
                      <th id="title">제목</th>
                      <th id="content">내용</th>
                      <th>날짜</th>
                      <th>Count</th>
                      <th colspan="2"> 버튼</th>
                  </tr>
                  <%
                      for (GuestVO vo : list) {
                  %>
                  <tr>
                      <td>
                          <%=vo.getUserId()%>
                      </td>
                      <td>
                          <a href="read.do?seq=<%=vo.getSeq()%>">
                          <%=vo.getTitle()%>
                          </a>
                      </td>
                      <td>
                          <%=vo.getContent()%>
                      </td>
                      <td>
                          <%=vo.getDate()%>
                      </td>
                      <td>
                          <%=vo.getReadCount()%>
                      </td>
                      <td>
                          <a href="BookServlet?command=UpdateBookWrite&id=<%=vo.getUserId()%>">
                              <button>변경하기</button>
                          </a>
                      </td>
                      <td>
                          <a href="BookServlet?command=DeleteBook&id=<%=vo.getUserId()%>">
                              <button>삭제하기</button>
                          </a>
                      </td>
                  </tr>
                  <%
                      }
                  %>
              </table>
                    <a href="GuestBookWrite.do">
<%--              <a href="BookServlet?command=GuestBookWrite">--%>
                  <button> 방명록 작성하기 </button>
              </a>
          </div>

      </article>
  </section>

  <%--푸터--%>
  <footer>
      <p>Footer</p>
  </footer>


</body>
</html>


