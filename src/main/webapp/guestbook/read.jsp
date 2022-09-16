<%@ page import="vo.GuestVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.ReplyVO" %><%--
  Created by IntelliJ IDEA.
  User: 윤태검
  Date: 2022-09-06
  Time: 오후 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read</title>

    <script>
        function fn_sendGuest() {

            var GuestBookWrite = document.GuestBookWrite;
            var title = GuestBookWrite.title.value;
            var content = GuestBookWrite.content.value;
            var readCount = GuestBookWrite.readCount.value;
            var userId = GuestBookWrite.userId.value;

            if (title.length === 0 || title === "") {
                alert("아이디는 필수 입니다.");
            } else if (content.length === 0 || content === "") {
                alert("비밀번호는 필수 입니다.");
            } else if (userId.length === 0 || userId === "") {
                alert("이메일은 필수 입니다.");
            } else {
                GuestBookWrite.method = "post";
                GuestBookWrite.action = "BookController";
                GuestBookWrite.submit();
            }
        }

        function fn_sendReply(){
            var GuestReplyWrite = document.GuestReplyWrite;

            GuestReplyWrite.method = "post";
            GuestReplyWrite.action = "InsertReply.do";
            GuestReplyWrite.submit();
        }

    </script>

    <!-- 스타일시트 연결 -->
    <link rel="stylesheet" href="CSS/WriteBook.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

</head>
<body>

<%
    // 보낸 값 받기 getAttribute  // 오브젝트를 memberVO 로 변경
    GuestVO vo = (GuestVO) request.getAttribute("guest");
%>

<%
    // 보낸 값 받기 getAttribute  // 오브젝트를 ArrayList 로 변경
    ArrayList<ReplyVO> list = (ArrayList<ReplyVO>) request.getAttribute("list");
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
            <h1> 게시글 </h1>
            <form name="GuestBookWrite">
                <table id="member_table">
                    <tr>
                        <th>
                            title
                        </th>
                        <td>
                            <input type="text" name="title" value="<%=vo.getTitle()%>" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            content
                        </th>
                        <td>
                            <input type="text" name="content" id="content" value="<%=vo.getContent()%>"
                                   readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            readCount
                        </th>
                        <td>
                            <input type="text" name="readCount" value="<%=vo.getReadCount()%>" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            date
                        </th>
                        <td>
                            <input type="text" name="date" value="<%=vo.getDate()%>" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            userId
                        </th>
                        <td>
                            <input type="text" name="userId" value="<%=vo.getUserId()%>" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <input type="reset" value="다시 입력">
                        </th>
                        <th>
                            <input type="button" value="글 수정하기" onclick="fn_sendGuest()">
                            <input type="hidden" name="command" value="UpdateGuest.do"/>
                        </th>
                    </tr>
                </table>
            </form>
        </div>

        <div id="reply_box">
            <%
                for (ReplyVO vo2 : list) {
            %>
                <table id="reply">
                    <tr>
                        <th> content </th>
                        <td><%=vo2.getContent()%></td>
                    </tr>
                    <tr>
                        <th> 작성일</th>
                        <td><%=vo2.getReg_date()%></td>
                    </tr>
                </table>
            <%
                }
            %>
        </div>

        <div id="WriteReplyBox">
            <form name="GuestReplyWrite">
                <input type="text" name="ReplyContent" id="ReplyContent">
                <input type="hidden" name="seq" value="<%=vo.getSeq()%>">
                <input type="button" value="글 작성" onclick="fn_sendReply()">
            </form>
        </div>
        
    </article>
</section>

<%--푸터--%>
<footer>
    <p>Footer</p>
</footer>

</body>
</html>
