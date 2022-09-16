package dao;

import vo.BookVO;
import vo.memberVO;
import dao.memberDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import CM.ConnectionManager;

public class memberDAO {
    // 도서 목록 리스트
    public ArrayList<BookVO> getBookList() throws SQLException {
        ArrayList<BookVO> list = new ArrayList<>();

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM books";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        //pstmt.setInt(1,Integer.parseInt(id));
        //pstmt.setInt(2,Integer.parseInt(pwd));
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        BookVO vo = null;
        while(rs.next()) {
            vo = new BookVO(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getDate(5));
            list.add(vo);
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return list;
    }
    
    public ArrayList<memberVO> getMember() throws SQLException {
        ArrayList<memberVO> list = new ArrayList<>();

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM member";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        //pstmt.setInt(1,Integer.parseInt(id));
        //pstmt.setInt(2,Integer.parseInt(pwd));
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        memberVO vo = null;
        while(rs.next()) {
            vo = new memberVO(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5));
            list.add(vo);
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return list;
    }

    public memberVO selectOne(String id) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        memberVO vo = null;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM member where id = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,id);
        //pstmt.setInt(2,Integer.parseInt(pwd));
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        if(rs.next()) {
            vo = new memberVO(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5));
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return vo;
    }

    public void deleteOne(String id) throws SQLException {

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "delete from member where id = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,id);
        int count = pstmt.executeUpdate();

        // 닫기
        pstmt.close();
        con.close();
    }

    public boolean InsertOne(memberVO vo) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        boolean flag = false;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "Insert into member (id,pwd,name,email) values(?,?,?,?)";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,vo.getId());
        pstmt.setString(2,vo.getPwd());
        pstmt.setString(3,vo.getName());
        pstmt.setString(4,vo.getEmail());
        //pstmt.setInt(2,Integer.parseInt(pwd));
        int count = pstmt.executeUpdate();

        // 쿼리 처리
        if(count > 0){
            flag = true;
        }

        // 닫기
        pstmt.close();
        con.close();

        return flag;
    }

    public boolean updateOne(String id,String name,String pwd,String email,String JoinDate) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        boolean flag = false;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "update member set pwd = ?, name = ?, email = ?, JoinDate = ? where id = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,pwd);
        pstmt.setString(2,name);
        pstmt.setString(3,email);
        pstmt.setString(4,JoinDate);
        pstmt.setString(5,id);
        //pstmt.setInt(2,Integer.parseInt(pwd));
        int count = pstmt.executeUpdate();

        // 쿼리 처리
        if(count > 0){
            flag = true;
        }

        // 닫기
        pstmt.close();
        con.close();

        return flag;
    }

}
