package com.board;

import sun.jvm.hotspot.oops.CellTypeState;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.auth.Subject;
import javax.sql.DataSource;
import javax.xml.transform.Result;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoradDAO {

    Connection  con;
    PreparedStatement pstmt;
    ResultSet rs;

    public void getCon() {
        try {
            Context initctx = new InitialContext();
            Context envctx = (Context) initctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envctx.lookup("jdbc/mysql");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void close(){
        try {
            if(con != null)con.close();
            if(pstmt != null)pstmt.close();
            if(rs != null)rs.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public int insertBoard(BoardBean boardBean){
        getCon();
        int readCount = 0;
        int boardNum = 1;
        try{
            String numSql = "select max(boardnum) from board";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                boardNum = rs.getInt(1) + 1;
            }
            String sql = "insert into board values(?,?,?,?,now(),?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,boardNum);
            pstmt.setString(2,boardBean.getMemberId());
            pstmt.setString(3,boardBean.getSubject());
            pstmt.setString(4,boardBean.getContent());
            pstmt.setInt(5, readCount);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }
    public ArrayList<BoardBean> getAllBoard(int stratRow, int endRow){
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();
        getCon();
        try{
            String sql = "select * from board order by boardnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,stratRow);
            pstmt.setInt(2,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardBean boardBean = new BoardBean();
                boardBean.setBoardNum(rs.getInt(1));
                boardBean.setMemberId(rs.getString(2));
                boardBean.setSubject(rs.getString(3));
                boardBean.setContent(rs.getString(4));
                boardBean.setDate(rs.getString(5));
                boardBean.setCount(rs.getInt(6));

                list.add(boardBean);
            }
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public int boardCount(String subject){
        getCon();
        int count =0;
        try {
            String countSql = "select count(*) from board where subject like ? ";
            pstmt = con.prepareStatement(countSql);
            pstmt.setString(1,"%"+subject+"%");
            rs = pstmt.executeQuery();
            if(rs.next())count  = rs.getInt(1);

        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }

    public ArrayList<BoardBean> boardSearch(String subject, int startRow, int endRow){
        ArrayList<BoardBean> list = new ArrayList<>();
        getCon();
        try{
            String sql ="select * from board where subject like ? order by boardnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+subject+"%");
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                BoardBean boardBean = new BoardBean();
                boardBean.setBoardNum(rs.getInt(1));
                boardBean.setMemberId(rs.getString(2));
                boardBean.setSubject(rs.getString(3));
                boardBean.setContent(rs.getString(4));
                boardBean.setDate(rs.getString(5));
                boardBean.setCount(rs.getInt(6));

                list.add(boardBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public BoardBean getBoard(int num){
        BoardBean boardBean = new BoardBean();
        getCon();
        try {
            String countSql = "update board set count = count + 1 where boardnum = ?";
            pstmt = con.prepareStatement(countSql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();

            String sql = "select * from board where boardnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                boardBean.setBoardNum(rs.getInt(1));
                boardBean.setMemberId(rs.getString(2));
                boardBean.setSubject(rs.getString(3));
                boardBean.setContent(rs.getString(4));
                boardBean.setDate(rs.getString(5));
                boardBean.setCount(rs.getInt(6));
            }
            return boardBean;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return null;
    }
    public int insertComment(String id, String comment,int boardNum){
        getCon();
        int commentNum = 1;
        try {
            String commentNumSql = "select max(commentNum) from comment";
            pstmt = con.prepareStatement(commentNumSql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                commentNum = rs.getInt(1) + 1;
            }
            String sql = "insert into comment values(?,?,?,?,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,boardNum);
            pstmt.setString(2,id);
            pstmt.setString(3,comment);
            pstmt.setInt(4,commentNum);
            pstmt.setInt(5 ,0);
            pstmt.setInt(6, 0);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int commentCount(int boardNum){
        getCon();
        int count = 0;
        try {
            String countSql = "select count(*) from comment where boardnum = ?";
            pstmt = con.prepareStatement(countSql);
            pstmt.setInt(1,boardNum);
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }
    public ArrayList<CommentBean> getAllComment(int boardNum, int startRow ,int endRow){
        ArrayList<CommentBean> list = new ArrayList<>();
        getCon();
        try {
            String sql = "select * from comment where boardNum = ? order by commentnum desc,re_seq asc limit ?,? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,boardNum);
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                CommentBean commentBean = new CommentBean();
                commentBean.setBoardNum(rs.getInt(1));
                commentBean.setMemberId(rs.getString(2));
                commentBean.setCommentContent(rs.getString(3));
                commentBean.setCommentNum(rs.getInt(4));
                commentBean.setRe_lev(rs.getInt(5));
                commentBean.setRe_seq(rs.getInt(6));
                commentBean.setDate(rs.getString(7));

                list.add(commentBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public int boardDelete(int num){
        getCon();
        try {
            String commentSql = "delete from comment where boardnum = ? ";
            pstmt = con.prepareStatement(commentSql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();
            String sql = "delete from board where boardnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public BoardBean getReWriteBoard(int num){
        BoardBean boardBean = new BoardBean();
        getCon();
        try {
            String sql = "select * from board where boardnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                boardBean.setBoardNum(rs.getInt(1));
                boardBean.setMemberId(rs.getString(2));
                boardBean.setSubject(rs.getString(3));
                boardBean.setContent(rs.getString(4));
                boardBean.setDate(rs.getString(5));
                boardBean.setCount(rs.getInt(6));
            }
            return boardBean;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return null;
    }
    public int boardUpdate(int boardNum,String subject,String content){
        getCon();
        try {
            String sql ="update board set subject = ? , content = ? where boardnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,subject);
            pstmt.setString(2,content);
            pstmt.setInt(3,boardNum);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    //댓글 수정
    public int commUpdate(int commNum, String commContent){
        getCon();
        try {
            String sql = "update comment set commentContent= ? where commentNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,commContent);
            pstmt.setInt(2,commNum);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return  1;
    }
    //댓글 삭제
    public int commentDelete(int reSeq, int commNum){
        getCon();
        try{
            String sql ="delete from comment where re_seq = ? and commentnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,reSeq);
            pstmt.setInt(2,commNum);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int commentReRegistry(String id,String comment1,int commNum,int boardNum){
        getCon();
        try {
            String reSql = "update comment set re_seq = re_seq + 1 where commentnum = ? and re_seq >0";
            pstmt = con.prepareStatement(reSql);
            pstmt.setInt(1, commNum);
            pstmt.executeUpdate();
            String sql = "insert into comment values(?,?,?,?,?,?,now())";
            pstmt =con.prepareStatement(sql);
            pstmt.setInt(1,boardNum);
            pstmt.setString(2,id);
            pstmt.setString(3,comment1);
            pstmt.setInt(4,commNum);
            pstmt.setInt(5,1);
            pstmt.setInt(6,1);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int inserContact(ContactBean contactBean){
        getCon();
        int num = 0;
        try{
            String numSql="select max(num) from contact";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                num = rs.getInt(1)+1;
            }
          String sql = "insert into contact values(?,?,?,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.setString(2,contactBean.getMemberId());
            pstmt.setString(3,contactBean.getSubject());
            pstmt.setString(4,contactBean.getContent());
            pstmt.setString(5,contactBean.getEmail());
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int mailListCount(String subject){
        getCon();
        int count = 0;
        try{
            String sql="select count(num) from contact where memberid like ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+subject+"%");
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }
    public ArrayList<ContactBean> getContact(String subject, int startRow, int endRow){
        getCon();
        ArrayList<ContactBean> list = new ArrayList<>();
        try {
            String sql ="select * from contact where memberid like ? order by num desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+subject+"%");
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ContactBean contactBean = new ContactBean();
                contactBean.setNum(rs.getInt(1));
                contactBean.setMemberId(rs.getString(2));
                contactBean.setSubject(rs.getString(3));
                contactBean.setContent(rs.getString(4));
                contactBean.setEmail(rs.getString(5));
                contactBean.setDate(rs.getString(6));

                list.add(contactBean);
            }
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public ContactBean getOneContact(int num){
        getCon();
        ContactBean contactBean = new ContactBean();
        try {
            String sql = "select * from contact where num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                contactBean.setNum(rs.getInt(1));
                contactBean.setMemberId(rs.getString(2));
                contactBean.setSubject(rs.getString(3));
                contactBean.setContent(rs.getString(4));
                contactBean.setEmail(rs.getString(5));
                contactBean.setDate(rs.getString(6));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return  contactBean;
    }
    public int insertContactSend(ContactSendBean contactSendBean){
        getCon();
        try{
            String sql="insert into contactsend values(?,?,?,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,contactSendBean.getNum());
            pstmt.setString(2,contactSendBean.getId());
            pstmt.setString(3,contactSendBean.getEmail());
            pstmt.setString(4,contactSendBean.getSubject());
            pstmt.setString(5,contactSendBean.getContent());
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int insertGallery(GalleryBean galleryBean){
        getCon();
        int num = 1;
        try{
            String numSql = "select max(num) from gallery";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                num = rs.getInt(1) + 1;
            }
            String sql = "insert into gallery values(?,?,?,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.setString(2,galleryBean.getId());
            pstmt.setString(3,galleryBean.getFileName());
            pstmt.setString(4,galleryBean.getSubject());
            pstmt.setInt(5,0);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int galleryCount(String subject){
        getCon();
        int count = 0;
        try {
            String sql = "select count(*) from gallery where subject like ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+subject+"%");
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }
    public ArrayList<GalleryBean> getAllGallery(String subject,int startRow,int endRow){
        getCon();
        ArrayList<GalleryBean> list = new ArrayList<>();
            try {
                String sql ="select * from gallery where subject like ? order by num desc limit ?,?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,"%"+subject+"%");
                pstmt.setInt(2,startRow);
                pstmt.setInt(3,endRow);
                rs = pstmt.executeQuery();
                while (rs.next()){
                    GalleryBean galleryBean = new GalleryBean();
                    galleryBean.setNum(rs.getInt(1));
                    galleryBean.setId(rs.getString(2));
                    galleryBean.setFileName(rs.getString(3));
                    galleryBean.setSubject(rs.getString(4));
                    galleryBean.setCount(rs.getInt(5));
                    galleryBean.setDate(rs.getString(6));

                    list.add(galleryBean);
                }
            } catch (Exception e){
                e.printStackTrace();
            } finally {
                close();
            }
        return list;
    }
    public int deleteGallery(int num){
        getCon();
        try {
            String sql = "delete from gallery where num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int galleryCount(int num){
        getCon();
        try {
            String sql ="update gallery set count = count + 1 where num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int insertLike(LikeBean likeBean){
        getCon();
        int num = 1;
        try {
            String numSql = "select max(num) from gallerylike";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                num = rs.getInt(1)+1;
            }
            String sql = "insert into gallerylike values(?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.setInt(2,likeBean.getGallerynum());
            pstmt.setString(3, likeBean.getId());
            pstmt.setInt(4,1);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int deleteLike(LikeBean likeBean){
        getCon();
        try {
            String sql = "delete from gallerylike where gallerynum = ? and id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, likeBean.getGallerynum());
            pstmt.setString(2, likeBean.getId());
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int likeCheck(String id,int galleryNum){
        getCon();
        try {
            String sql = "select * from gallerylike where id = ? and gallerynum = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setInt(2,galleryNum);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return 1;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }
    public int likeCount(int gallNum){
        getCon();
        int count = 0;
        try {
            String sql = "select sum(likecount) from gallerylike where gallerynum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,gallNum);
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }
}
