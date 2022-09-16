<%@ page import="vo.memberVO" %><%--
  Created by IntelliJ IDEA.
  User: 윤태검
  Date: 2022-09-01
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <script type="text/javascript">
        function fn_UpdateMember() {

            var frmMember = document.frmUpdateMember;

            var id = frmMember.id.value;
            var pwd = frmMember.pwd.value;
            var name = frmMember.name.value;
            var email = frmMember.email.value;

            if (id.length === 0 || id === "") {
                alert("아이디는 필수 입니다.");
            } else if (pwd.length === 0 || pwd === "") {
                alert("비밀번호는 필수 입니다.");
            } else if (name.length === 0 || name === "") {
                alert("이름은 필수 입니다.");
            } else if (email.length === 0 || email === "") {
                alert("이메일은 필수 입니다.");
            } else {
                frmMember.method = "post";
                frmMember.action = "MyServlet";
                frmMember.submit();
            }

        }
    </script>
    <link rel="stylesheet" href="CSS/m_list.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
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
            <li>
                <a href="MyServlet?command=Home">
                    <button> Home</button>
                </a>
            </li>
        </ul>
    </nav>
    <article>
        <div id="Main_Box">
            <h1> 회원 정보 변경 </h1>

            <form name="frmUpdateMember">
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
                    <tr>
                        <td>
                            <%=vo.getId()%>
                            <input type="hidden" name="id" value="<%=vo.getId()%>">
                        </td>
                        <td>
                            <input type="text" name="pwd">
                        </td>
                        <td>
                            <input type="text" name="name">
                        </td>
                        <td>
                            <input type="text" name="email">
                        </td>
                        <td>
                            <input type="text" name="JoinDate">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="button" value="변경하기" onclick="fn_UpdateMember()">
                            <input type="hidden" name="command" value="update"/>
                        </td>
                    </tr>
                </table>
            </form>
            <a href="MyServlet?command=list"> 뒤로가기 </a>
        </div>
    </article>
</section>

<%--푸터--%>
<footer>
    <p>Footer</p>
</footer>


</body>
</html>
