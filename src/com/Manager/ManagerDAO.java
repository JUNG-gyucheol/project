package com.Manager;

import com.product.ProductSizeBean;
import com.product.ProductsBottomSizeBean;
import com.product.ProductsShoesBean;
import jdk.nashorn.internal.ir.ReturnNode;
import sun.jvm.hotspot.memory.EdenSpace;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;
import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ManagerDAO {
    Connection con;
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

    public void close() {
        try {
            if (con != null) con.close();
            if (pstmt != null) pstmt.close();
            if (rs != null) rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int todaySales() {
        getCon();
        int today = 0;
        try {
          String sql =  "select sum(purchasePrice) from purchaseList where date > curdate()";
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          if(rs.next()){
              today = rs.getInt(1);
          }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return today;
    }
    public int grossSales(){
        getCon();
        int gross = 0;
        try {
           String sql = "select sum(purchasePrice) from purchaseList";
           pstmt = con.prepareStatement(sql);
           rs = pstmt.executeQuery();
           if(rs.next()){
               gross = rs.getInt(1);
           }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return gross;
    }
    public ArrayList<TopTenBean> topTenList(){
        getCon();
        ArrayList<TopTenBean> list = new ArrayList<>();
        try {
           String sql = "select productnum,thumbnail,purchaseitem,productPrice,purchaseColor,purchaseCategory,sum(purchasePrice) as 'SUM' from purchaselist group by productnum,thumbnail,purchaseitem,purchaseCategory,productPrice,purchaseColor order by SUM desc limit 0,10";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                TopTenBean topTenBean = new TopTenBean();
                topTenBean.setProductnum(rs.getInt(1));
                topTenBean.setThumbnail(rs.getString(2));
                topTenBean.setPurchaseitem(rs.getString(3));
                topTenBean.setProductPrice(rs.getInt(4));
                topTenBean.setPurchaseColor(rs.getString(5));
                topTenBean.setPurchaseCategory(rs.getString(6));
                topTenBean.setSumProductSales(rs.getInt(7));

                list.add(topTenBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public int refundCount(){
        getCon();
        int count = 0;
        try {
                String sql = "select count(*) from refund";
                pstmt = con.prepareStatement(sql);
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
    public ArrayList<RefundBean> refundBeanArrayList(int startRow,int endRow){
        getCon();
        ArrayList<RefundBean> refundBeanArrayList = new ArrayList<>();
        try {
            String sql = "select * from refund order by num desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,startRow);
            pstmt.setInt(2,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                RefundBean refundBean = new RefundBean();
                refundBean.setNum(rs.getInt(1));
                refundBean.setProductNum(rs.getInt(2));
                refundBean.setThumbnail(rs.getString(3));
                refundBean.setProductPrice(rs.getInt(4));
                refundBean.setPurchaseId(rs.getString(5));
                refundBean.setPurchaseitem(rs.getString(6));
                refundBean.setPurchasePrice(rs.getInt(7));
                refundBean.setPurchaseStock(rs.getInt(8));
                refundBean.setPurchaseColor(rs.getString(9));
                refundBean.setPurchaseSize(rs.getString(10));
                refundBean.setPurchaseCategory(rs.getString(11));
                refundBean.setPostcode(rs.getString(12));
                refundBean.setAddress(rs.getString(13));
                refundBean.setPayment(rs.getString(14));
                refundBean.setDate(rs.getString(15));

                refundBeanArrayList.add(refundBean);
            }
        } catch (Exception e){
            close();
        } finally {
            close();
        }
        return refundBeanArrayList;
    }
    public ArrayList<ProductSizeBean> productTop(String topName,int startRow,int endRow){
      getCon();
      ArrayList<ProductSizeBean> list = new ArrayList<>();
        try {
            String sql = "select * from productstop where productname like ? order by productNum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+topName+"%");
            pstmt.setInt(2,startRow);
            pstmt.setInt(3, endRow);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductSizeBean productSizeBean = new ProductSizeBean();
                productSizeBean.setProductNum(rs.getInt(1));
                productSizeBean.setProductName(rs.getString(2));
                productSizeBean.setColor(rs.getString(3));
                productSizeBean.setXLarge(rs.getInt(4));
                productSizeBean.setLarge(rs.getInt(5));
                productSizeBean.setMedium(rs.getInt(6));
                productSizeBean.setSmall(rs.getInt(7));

                list.add(productSizeBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
      return list;
    }
    public ArrayList<ProductsBottomSizeBean> productBottom(String bottomName,int startRow,int endRow) {
        getCon();
        ArrayList<ProductsBottomSizeBean> list = new ArrayList<>();
        try {
            String sql = "select * from productsbottom where productname like ? order by productnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+bottomName+"%");
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductsBottomSizeBean bottomSizeBean = new ProductsBottomSizeBean();
                bottomSizeBean.setProductNum(rs.getInt(1));
                bottomSizeBean.setProductName(rs.getString(2));
                bottomSizeBean.setColor(rs.getString(3));
                bottomSizeBean.setSize33(rs.getInt(4));
                bottomSizeBean.setSize32(rs.getInt(5));
                bottomSizeBean.setSize31(rs.getInt(6));
                bottomSizeBean.setSize30(rs.getInt(7));
                bottomSizeBean.setSize29(rs.getInt(8));
                bottomSizeBean.setSize28(rs.getInt(9));
                bottomSizeBean.setSize27(rs.getInt(10));
                bottomSizeBean.setSize26(rs.getInt(11));

                list.add(bottomSizeBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public ArrayList<ProductsShoesBean> productShoes(String shoesName,int startRow,int endRow) {
        getCon();
        ArrayList<ProductsShoesBean> list = new ArrayList<>();
        try {
            String sql = "select * from productshoes  where productname like ? order by productNum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+shoesName+"%");
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductsShoesBean shoesBean = new ProductsShoesBean();
                shoesBean.setProductNum(rs.getInt(1));
                shoesBean.setProductName(rs.getString(2));
                shoesBean.setColor(rs.getString(3));
                shoesBean.setSize290(rs.getInt(4));
                shoesBean.setSize280(rs.getInt(5));
                shoesBean.setSize270(rs.getInt(6));
                shoesBean.setSize260(rs.getInt(7));
                shoesBean.setSize250(rs.getInt(8));
                shoesBean.setSize240(rs.getInt(9));
                shoesBean.setSize230(rs.getInt(10));
                shoesBean.setSize220(rs.getInt(11));

                list.add(shoesBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public int stockTopCount(String topName){
        getCon();
        int count = 0;
        try {
            String sql ="select count(*) from productsTop where productname like ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+topName+"%");
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
    public int stockBottomCount(String bottomName){
        getCon();
        int count = 0;
        try {
            String sql ="select count(*) from productsBottom where productname like ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+bottomName+"%");
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
    public int stockShoesCount(String ShoesName){
        getCon();
        int count = 0;
        try {
            String sql ="select count(*) from productshoes where productname like ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+ShoesName+"%");
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
