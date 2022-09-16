package vo;

import java.util.ArrayList;

public class RentalBookVO {
    // 대충 장부의 정보 학생의 학번, 분류 번호, 대출일, 반납예정일
    private String memberID;
    private int BookNo;
    private int RentalDay;
    private int ReturnDay;

    private String BookName;


    public String getBookName() {
        return BookName;
    }

    public void setBookName(ArrayList<BookVO> list) {
        String Bname = null;
        for(BookVO vo : list){
            if(vo.getBookNo() == this.BookNo){
                Bname = vo.getBookName();
            }
        }
        BookName = Bname;
    }

    public RentalBookVO(String memberID, int BookNo, int RentalDay, int ReturnDay){
        this.memberID = memberID;
        this.BookNo = BookNo;
        this.RentalDay = RentalDay;
        this.ReturnDay = ReturnDay;
    }

    public String getStudentNo() {
        return memberID;
    }

    public void setStudentNo(String memberID) {
        memberID = memberID;
    }

    public int getBookNo() {
        return BookNo;
    }

    public void setBookNo(int bookNo) {
        BookNo = bookNo;
    }

    public int getRentalDay() {
        return RentalDay;
    }

    public void setRentalDay(int rentalDay) {
        RentalDay = rentalDay;
    }

    public int getReturnDay() {
        return ReturnDay;
    }

    public void setReturnDay(int returnDay) {
        ReturnDay = returnDay;
    }
}
