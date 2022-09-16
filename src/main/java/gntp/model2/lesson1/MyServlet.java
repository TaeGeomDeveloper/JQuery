package gntp.model2.lesson1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import dao.memberDAO;
import org.json.simple.parser.ParseException;
import service.MemberService;
import vo.BookVO;
import vo.memberVO;

import java.sql.SQLException;
import java.util.ArrayList;

public class MyServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        System.out.println("init");
    }

    public ArrayList<memberVO> getMember() {
        ArrayList<memberVO> list = new ArrayList<memberVO>();
        memberDAO dao = new memberDAO();

        try {
            list = dao.getMember();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet");
        resp.setContentType("text/html; charset=UTF-8");

        String command = req.getParameter("command");
        req.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        //out.print("<h1> Hi! Servlet~ </h1>");

        memberDAO dao = new memberDAO();

        String url = "Member.jsp";

        boolean isStop = false;

        // 전체 회원 리스트
        if (command.equals("list")) {

            // 전체 조회
            ArrayList<memberVO> list = new ArrayList<memberVO>();
            try {
                list = dao.getMember();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("list", list);
            url = "link/list.jsp";
        }

        // 도서 목록 리스트
        if (command.equals("BookList")) {

            // 전체 조회
            ArrayList<BookVO> list = new ArrayList<BookVO>();
            try {
                list = dao.getBookList();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("list", list);
            url = "link/BookList.jsp";
        }

        // 개별 회원 정보
        else if(command.equals("read")){

            // 개별 회원 정보 조회
            String id = req.getParameter("id");
            memberVO member = null;

            try {
                member = dao.selectOne(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("member", member);
            url = "link/viewMemberInfo.jsp";
        }

        // 회원 가입 페이지
        else if(command.equals("Insert")) {
            url = "link/Insert.jsp";
        }

        // 회원 변경 페이지
        else if(command.equals("Update")) {

            // 개별 회원 정보 조회
            String id = req.getParameter("id");
            memberVO member = null;

            try {
                member = dao.selectOne(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("member", member);

            url = "link/Update.jsp";
        }

        // 회원 삭제
        else if(command.equals("delete")) {

            // 개별 회원
            String id = req.getParameter("id");

            try {
                dao.deleteOne(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            url = "MyServlet?command=list";
        } // ajax
        else if(command.equals("ajax")) {
            String userid = req.getParameter("userid");
            System.out.println("ajax "+userid);

            //DAO 요청

            boolean flag =  new MemberService().isMember(userid);

            if(flag != true) {
                resp.getWriter().print("사용할 수 있는 ID 입니다.");
            }else {
                resp.getWriter().print("사용할 수 없는 ID 입니다.");
            }

            isStop = true;

        } else if(command.equals("json")){
            String jsonStr = req.getParameter("name");
            System.out.println(jsonStr);

            MemberService ms = new MemberService();

            try {
                ms.testJsonObject(jsonStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

            String temp = ms.sendData();
            System.out.println(temp);
            resp.getWriter().print(temp);

            isStop = true;
        }
        if(!isStop) {
            // resp.sendRedirect("./link/list.jsp");
            RequestDispatcher rd = req.getRequestDispatcher(url);
            // RequestDispatcher rd = req.getRequestDispatcher("../../webapp/link/list.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        System.out.println("doPost");
        resp.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String command = req.getParameter("command");

        PrintWriter out = resp.getWriter();
        //out.print("<h1> Hi! Servlet~ </h1>");
        memberDAO dao = new memberDAO();

        String url = "link/list.jsp";

        // 회원 가입 추가하기
        if(command.equals("InsertMember")){

            // 추가 회원 내용
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String pwd = req.getParameter("pwd");
            String email = req.getParameter("email");
            memberVO member = new memberVO(id,pwd,name,email,null);

            // 로직 처리
            try {
                boolean flag = dao.InsertOne(member);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // 리스트 처리
            ArrayList<memberVO> list = new ArrayList<memberVO>();
            try {
                list = dao.getMember();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("list", list);

            url = "MyServlet?command=list";
        }

        else if(command.equals("update")) {

            // 업데이트 내용
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String pwd = req.getParameter("pwd");
            String email = req.getParameter("email");
            String JoinDate = req.getParameter("JoinDate");

            // 로직 처리
            try {
                boolean flag = dao.updateOne(id,name,pwd,email,JoinDate);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // 리스트 처리
            ArrayList<memberVO> list = new ArrayList<memberVO>();
            try {
                list = dao.getMember();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("list", list);

            url = "MyServlet?command=list";
        }

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("destory");
    }
}