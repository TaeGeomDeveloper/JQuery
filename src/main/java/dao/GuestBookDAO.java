package dao;

import CM.ConnectionManager;
import vo.GuestVO;
import vo.ReplyVO;
import vo.memberVO;

import java.sql.*;
import java.util.ArrayList;

public class GuestBookDAO {

    public void deleteOne(String id) throws SQLException {

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "delete from guestbook where user_id = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,id);
        int count = pstmt.executeUpdate();

        // 닫기
        pstmt.close();
        con.close();
    }
    public GuestVO selectOne(String id) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        GuestVO vo = null;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM guestbook where user_id = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,id);
        //pstmt.setInt(2,Integer.parseInt(pwd));
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        if(rs.next()) {
            vo = new GuestVO(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5),
                    rs.getInt(6));
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return vo;
    }

    public GuestVO selectSeq(String seq) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        GuestVO vo = null;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM guestbook where seq = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,seq);
        //pstmt.setInt(2,Integer.parseInt(pwd));
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        if(rs.next()) {
            vo = new GuestVO(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5),
                    rs.getInt(6));
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return vo;
    }

    public GuestVO selectOneV2(String seq) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        GuestVO guest = null;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        //조회수 업데이트
        String sql = "update guestbook set read_count = read_count + 1 where seq = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1,Integer.parseInt(seq));
        int affectedCount = pstmt.executeUpdate();
        boolean flag = false;
        if(affectedCount > 0){
            flag = true;
        }


        // 해당글 조회
        sql = "select * from guestbook g left join reply r on  g.seq = r.seq where g.seq=1";
        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        pstmt.setInt(1,Integer.parseInt(seq));
        ResultSet rs = pstmt.executeQuery();

        ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
        // 쿼리 처리
        ReplyVO vo = null;
        if(rs.next()) {
            if(guest == null) {
                guest = new GuestVO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6)+1);
            }
            System.out.println("Null is "+rs.getString(9));

            vo = new ReplyVO(rs.getInt(7),
                    rs.getString(8),
                    rs.getTimestamp(9),
                    rs.getInt(10));
            list.add(vo);
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return guest;
    }


    public ArrayList<GuestVO> getGuestBookList() throws SQLException {
        ArrayList<GuestVO> list = new ArrayList<>();

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM guestbook";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        //pstmt.setInt(1,Integer.parseInt(id));
        //pstmt.setInt(2,Integer.parseInt(pwd));
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        GuestVO vo = null;
        while(rs.next()) {
            vo = new GuestVO(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5),
                    rs.getInt(6));
            list.add(vo);
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return list;
    }

    public boolean updateOne(GuestVO vo) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        boolean flag = false;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "update guestbook set title = ?, content = ? where user_id = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,vo.getTitle());
        pstmt.setString(2,vo.getContent());
        pstmt.setString(3,vo.getUserId());
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

    public boolean InsertGuest(GuestVO vo) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        boolean flag = false;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "Insert into guestbook (user_id,title,content,read_count) values(?,?,?,?)";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,vo.getUserId());
        pstmt.setString(2,vo.getTitle());
        pstmt.setString(3,vo.getContent());
        pstmt.setInt(4,vo.getReadCount());
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

    public ArrayList<ReplyVO> getReplyList(String seq) throws SQLException {
        ArrayList<ReplyVO> list = new ArrayList<>();

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "SELECT * FROM reply where seq = ?";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,seq);
        ResultSet rs = pstmt.executeQuery();

        // 쿼리 처리
        ReplyVO vo = null;
        while(rs.next()) {
            vo = new ReplyVO(rs.getInt(1),
                    rs.getString(2),
                    rs.getDate(3),
                    rs.getInt(4));
            list.add(vo);
        }

        // 닫기
        ConnectionManager.closeConnection(rs,pstmt,con);

        return list;
    }

    public boolean InsertReply(ReplyVO vo) throws SQLException {
        //ArrayList<memberVO> list = new ArrayList<>();
        boolean flag = false;

        // 컨낵션 정보
        Connection con = ConnectionManager.getConnetion();

        // 쿼리부분     아이디, 비밀번호, 이름
        String sql = "Insert into reply (content,seq) values(?,?)";

        // 특정한 쿼리만 통과 하는 전용 통로 작성.
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 쿼리 ? 부분에 값을 넣어 비교 해준다.
        pstmt.setString(1,vo.getContent());
        pstmt.setInt(2,vo.getSeq());
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
