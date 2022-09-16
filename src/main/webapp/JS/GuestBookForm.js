
function fn_sendGuest(){

    var GuestBookWrite = document.GuestBookWrite;

    var title = GuestBookWrite.title.value;
    var content = GuestBookWrite.content.value;
    var readCount = GuestBookWrite.readCount.value;
    var date = GuestBookWrite.date.value;
    var userId = GuestBookWrite.userId.value;

    if(title.length === 0 || title === "") {
        alert("아이디는 필수 입니다.");
    } else if(content.length === 0 || content === "") {
        alert("비밀번호는 필수 입니다.");
    } else if(readCount.length === 0 || readCount === "") {
        alert("이름은 필수 입니다.");
    } else if(date.length === 0 || date === "") {
        alert("이메일은 필수 입니다.");
    } else if(userId.length === 0 || userId === "") {
        alert("이메일은 필수 입니다.");
    }
        else {
        GuestBookWrite.method = "post";
        GuestBookWrite.action = "BookServlet";
        GuestBookWrite.submit();
    }

}