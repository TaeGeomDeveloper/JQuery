<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-09-16
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jquery</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        // 제이쿼리 함수 를 읽어준다.
        $(document).ready(function () {
            //alert('Read');
            // DOM 이 로드되는 이벤트 처리 함수 입니다.
            $('#btn_call').on('click', function () {
                //alert('event calling');
                alert($("#content").html());
            });

            $('#btn_json').on('click', function () {
                let jsonStr = '{"name": ["kim","lee","park"]}';
                let jsonObj = JSON.parse(jsonStr);
                for (let idx in jsonObj.name) {
                    ///console.log(jsonObj.name[idx]);
                }
                for (let val of jsonObj.name) {
                    console.log(val);
                }
            });

            $('#btn_ajax').on('click', function () {
                // 제이쿼리 함수 를 읽어준다.
                let jsonStr = '{"name": ["kim","lee","park"]}';

                $.ajax({
                    type: "get",
                    dataType: "text",
                    async: false,
                    url: "MyServlet?command=json",
                    // name 으로 jsonStr 데이터를 ajax로 전송
                    data: {name: jsonStr},
                    success: function (data, status) {
                        alert('success ' + data);
                        let array = JSON.parse(data);
                        let list = array.members;
                        for(const obj of list){
                            console.log(obj.name+" , "+obj.age+" , "+obj.id);
                        }
                       // console.log(data.members);
                    },
                    error: function (data, status) {
                        alert('error' + status)
                    },
                    complete: function (data, status) {
                        //alert('Complete');
                    }
                });
            });

        });
    </script>
</head>
<body>
<h1>Jquery</h1>

<button id="btn_call">이벤트 호출</button>

<div id="content">제이쿼리 입니다.</div>

<button id="btn_json">json 테스트</button>

<button id="btn_ajax">ajax 테스트</button>

</body>
</html>
