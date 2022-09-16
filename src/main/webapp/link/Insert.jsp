<%--
  Created by IntelliJ IDEA.
  User: 윤태검
  Date: 2022-09-02
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert</title>

    <link rel="stylesheet" href="CSS/m_list.css" type="text/css">
    <link rel="stylesheet" href="CSS/Main.css" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

<%--    Jquery CDN 연결하여 id 값을 읽어서 경고 창을 출력 하는 코드 작성 --%>
<%--    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
    <script type="text/javascript" src="JS/jquery-3.6.1.min.js"></script>
    <script type="text/javascript">
        // 제이쿼리 함수 를 읽어준다.
        $(document).ready(function () {
            //alert('Read');
            // DOM 이 로드되는 이벤트 처리 함수 입니다.
            $('#btn_idcheck').on('click', function(){
                let value = $('#userid').val();
                //alert(value);
                //alert($("#content").html());
                $.ajax({
                   type:"get",
                   dataType : "text",
                   async: false,
                   url : "MyServlet?command=ajax",
                   data : {userid:value},
                   success : function(data,status) {
                       alert('success '+data);
                       //$('#message').append(data);
                       $('#message').html("<h3 style='display: inline; color: red;'>"+data+"</h3>");
                   },
                    error : function(data,status) {
                        alert('error'+status)
                    },
                    complete : function(data,status) {
                        //alert('Complete');
                    }
                });
            })
        });
    </script>

    <script type="text/javascript">
        function fn_sendMember() {

            var frmMember = document.frmMember;

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

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
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

            <h1> 회원 가입 </h1>

            <form name="frmMember">
                <table id="member_table">
                    <tr>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>이름</th>
                        <th>이메일</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="id" id="userid">
                            <input type="button" id="btn_idcheck" value="id_check"><br/>
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
                    </tr>
                    <tr>
                        <td colspan="2">
                            result : <div id="message" style="display: inline"></div>
                        </td>
                        <td colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="button" value="가입하기" onclick="fn_sendMember()">
                            <input type="hidden" name="command" value="InsertMember"/>
                        </td>
                        <td colspan="2"><input type="reset" value="다시 입력"></td>
                    </tr>
                </table>
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
