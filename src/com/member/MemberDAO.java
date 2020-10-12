package com.member;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    public void getCon() {
        try {
        Context initctx = new InitialContext();
        Context envctx = (Context) initctx.lookup("java:comp/env");
        DataSource ds = (DataSource) envctx.lookup("jdbc/mysql");
        con = ds.getConnection();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public void close(){
        try{
            if(con != null)con.close();
            if(pstmt != null)pstmt.close();
            if(rs != null)rs.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public int insertMember(MemberBean memberBean){
        int num = 1;
        int grade = 0;
        getCon();
        try {
            String numSql = "select max(usernum) from member_Join";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                num = rs.getInt(1) + 1;
            }
            String sql="insert into member_Join values (?,?,?,?,?,?,?,?,?,?,now(),?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.setString(2,memberBean.getUserID());
            pstmt.setString(3,memberBean.getUserPW());
            pstmt.setString(4,memberBean.getUserName());
            pstmt.setString(5,memberBean.getGender());
            pstmt.setString(6,memberBean.getBirth());
            pstmt.setString(7,memberBean.getUserEmail());
            pstmt.setString(8,memberBean.getPhone());
            pstmt.setString(9,memberBean.getPostCode());
            pstmt.setString(10,memberBean.getAdress());
            pstmt.setInt(11,grade);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
            return 0;
        } finally {
            close();
        }
        return 1;
    }
    public int idCheck(String id){
        getCon();
        try {
            String sql = "select userid from member_join where userid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return 1;
            } else{
                return 0;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return -1;
    }

    public int login(String userId, String userPW) {
        getCon();
        try {
            String sql = "select userid, userpw from member_join where userid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(userPW.equals(rs.getString(2))){
                    return 1;
                } else{
                    return 2;
                }
            } else{
                return -1;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }
    public int getGrade(String userId) {
        getCon();
        int grade =0;
        try {
            String sql = "select grade from member_join where userid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                grade = rs.getInt(1);
                return grade;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public ArrayList<MemberBean> getAllMember(String id){
        ArrayList<MemberBean> list = new ArrayList<MemberBean>();
        getCon();
        try {
            String sql = "select * from member_join where grade < 3 and userid like  ? order by usernum desc";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+id+"%");
            rs = pstmt.executeQuery();
            while(rs.next()){
                MemberBean memberBean = new MemberBean();
                memberBean.setUserNum(rs.getInt(1));
                memberBean.setUserID(rs.getString(2));
                memberBean.setUserPW(rs.getString(3));
                memberBean.setUserName(rs.getString(4));
                memberBean.setGender(rs.getString(5));
                memberBean.setBirth(rs.getString(6));
                memberBean.setUserEmail(rs.getString(7));
                memberBean.setPhone(rs.getString(8));
                memberBean.setPostCode(rs.getString(9));
                memberBean.setAdress(rs.getString(10));
                memberBean.setDate(rs.getString(11));
                memberBean.setGrade(rs.getString(12));

                list.add(memberBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public String getAdminEmail(int grade){

        return null;
    }
    public MemberBean getOneMember(String id){
        getCon();
        MemberBean memberBean = new MemberBean();
        try {
            String sql = "select * from member_join where userID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                memberBean.setUserNum(rs.getInt(1));
                memberBean.setUserID(rs.getString(2));
                memberBean.setUserPW(rs.getString(3));
                memberBean.setUserName(rs.getString(4));
                memberBean.setGender(rs.getString(5));
                memberBean.setBirth(rs.getString(6));
                memberBean.setUserEmail(rs.getString(7));
                memberBean.setPhone(rs.getString(8));
                memberBean.setPostCode(rs.getString(9));
                memberBean.setAdress(rs.getString(10));
                memberBean.setDate(rs.getString(11));
                memberBean.setGrade(rs.getString(12));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return memberBean;
    }
    public int memberUpdate(int num, String pass, String name, String birth, String email,
                            String phone, String postCode, String addre){
        getCon();
        try {
            String sql = "update member_join set userPW = ?,userName = ?,birth = ? ,userEmail = ?," +
                    " phone = ?, postCode = ?, Adress = ? where userNum = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,pass);
            pstmt.setString(2,name);
            pstmt.setString(3,birth);
            pstmt.setString(4,email);
            pstmt.setString(5,phone);
            pstmt.setString(6,postCode);
            pstmt.setString(7,addre);
            pstmt.setInt(8, num);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
    public int memberFind(String name, String id){
        getCon();
        try{
            String sql = "select * from member_Join where userID = ? and userName = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,name);
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
    public int passwordChange(String id,String pw){
        getCon();
        try {
            String sql = "UPDATE member_Join SET userPW = ? where userID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,pw);
            pstmt.setString(2,id);
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
}
