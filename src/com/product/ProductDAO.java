package com.product;

import jdk.internal.org.objectweb.asm.TypeReference;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sound.midi.Soundbank;
import javax.sql.DataSource;
import java.net.ServerSocket;
import java.nio.file.attribute.AclEntryPermission;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.temporal.Temporal;
import java.util.ArrayList;
import java.util.RandomAccess;

public class ProductDAO {

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

    public int productRegistry(ProductBean productBean) {
        getCon();
        int productNum = 1;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                productNum = rs.getInt(1) + 1;
            }
            String productSql = "insert into products values(?,?,?,?,?,?,?,now())";
            pstmt = con.prepareStatement(productSql);
            pstmt.setInt(1, productNum);
            pstmt.setString(2, productBean.getBrand());
            pstmt.setString(3, productBean.getProductName());
            pstmt.setString(4, productBean.getProductPrice());
            pstmt.setString(5, productBean.getProductColor());
            pstmt.setString(6, productBean.getProductContent());
            pstmt.setString(7, productBean.getMainCategory());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int insertTop(ProductSizeBean productSizeBean) {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products ";
            pstmt = con.prepareStatement(numSql);
//            pstmt.setString(1, productSizeBean.getProductName());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql = "insert into  productsTop values(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, productSizeBean.getProductName());
            pstmt.setString(3, productSizeBean.getColor());
            pstmt.setInt(4, productSizeBean.getXLarge());
            pstmt.setInt(5, productSizeBean.getLarge());
            pstmt.setInt(6, productSizeBean.getMedium());
            pstmt.setInt(7, productSizeBean.getSmall());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int insertBottom(ProductsBottomSizeBean bottomSizeBean) {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
//            pstmt.setString(1, bottomSizeBean.getProductName());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql = "insert into productsbottom values(?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, bottomSizeBean.getProductName());
            pstmt.setString(3, bottomSizeBean.getColor());
            pstmt.setInt(4, bottomSizeBean.getSize33());
            pstmt.setInt(5, bottomSizeBean.getSize32());
            pstmt.setInt(6, bottomSizeBean.getSize31());
            pstmt.setInt(7, bottomSizeBean.getSize30());
            pstmt.setInt(8, bottomSizeBean.getSize29());
            pstmt.setInt(9, bottomSizeBean.getSize28());
            pstmt.setInt(10, bottomSizeBean.getSize27());
            pstmt.setInt(11, bottomSizeBean.getSize26());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int insertShoes(ProductsShoesBean shoesBean) {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
//            pstmt.setString(1, shoesBean.getProductName());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql = "insert into productshoes values(?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, shoesBean.getProductName());
            pstmt.setString(3, shoesBean.getColor());
            pstmt.setInt(4, shoesBean.getSize290());
            pstmt.setInt(5, shoesBean.getSize280());
            pstmt.setInt(6, shoesBean.getSize270());
            pstmt.setInt(7, shoesBean.getSize260());
            pstmt.setInt(8, shoesBean.getSize250());
            pstmt.setInt(9, shoesBean.getSize240());
            pstmt.setInt(10, shoesBean.getSize230());
            pstmt.setInt(11, shoesBean.getSize220());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public ArrayList<ProductBean> productsList() {
        ArrayList<ProductBean> list = new ArrayList<>();
        getCon();
        try {
            String sql = "select * from products";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductBean productBean = new ProductBean();
                productBean.setProductNum(rs.getInt(1));
                productBean.setBrand(rs.getString(2));
                productBean.setProductName(rs.getString(3));
                productBean.setProductPrice(rs.getString(4));
                productBean.setProductContent(rs.getString(5));
                productBean.setMainCategory(rs.getString(6));
                productBean.setDate(rs.getString(7));

                list.add(productBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }

    public int insertThumbnail(String thumbnail, String productName, String productPrice, String productColor, String category) {
        getCon();
        int productNum = 0;
        try {
            String productNumSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(productNumSql);
//            pstmt.setString(productName);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                productNum = rs.getInt(1);
            }
            String sql = "insert into thumbnail values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            pstmt.setString(2, productName);
            pstmt.setString(3, productPrice);
            pstmt.setString(4, productColor);
            pstmt.setString(5, thumbnail);
            pstmt.setString(6, category);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public String getCategory() {
        getCon();
        String cate = null;
        int num = 0;
        try {
            String sql = "select max(productNum) from products";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql1 = "select maincategory from products where productnum = ?";
            pstmt = con.prepareStatement(sql1);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                cate = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return cate;
    }

    public int productCancle() {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql = "delete from products where productnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public int productTopCancle() {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            System.out.println(num);
            String sql = "delete from  productsTop where productnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public int productBottomCancle() {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql = "delete from  productsbottom where productnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public int productShoesCancle() {
        getCon();
        int num = 0;
        try {
            String numSql = "select max(productNum) from products";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            String sql = "delete from  productshoes where productnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public ArrayList<ThumbnailBean> listThunbnail(int startRow,int endRow) {
        getCon();
        ArrayList<ThumbnailBean> list = new ArrayList<ThumbnailBean>();
        try {
            String sql = "select * from thumbnail order by productnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,startRow);
            pstmt.setInt(2,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ThumbnailBean thumbnailBean = new ThumbnailBean();
                thumbnailBean.setProductNum(rs.getInt(1));
                thumbnailBean.setProductName(rs.getString(2));
                thumbnailBean.setProductPrice(rs.getString(3));
                thumbnailBean.setProductColor(rs.getString(4));
                thumbnailBean.setThumbnail(rs.getString(5));
                thumbnailBean.setCategory(rs.getString(6));
                list.add(thumbnailBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }

    public ProductBean getOneproduct(int productNum) {
        getCon();
          ProductBean productBean = new ProductBean();
        try {
            String sql = "select * from products where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                productBean.setProductNum(rs.getInt(1));
                productBean.setBrand(rs.getString(2));
                productBean.setProductName(rs.getString(3));
                productBean.setProductPrice(rs.getString(4));
                productBean.setProductColor(rs.getString(5));
                productBean.setProductContent(rs.getString(6));
                productBean.setMainCategory(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return productBean;
    }

    public ProductSizeBean productTop(int productNum) {
        getCon();
        ProductSizeBean productSizeBean = new ProductSizeBean();
        try {
            String sql = "select * from productstop where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                productSizeBean.setProductNum(rs.getInt(1));
                productSizeBean.setProductName(rs.getString(2));
                productSizeBean.setColor(rs.getString(3));
                productSizeBean.setXLarge(rs.getInt(4));
                productSizeBean.setLarge(rs.getInt(5));
                productSizeBean.setMedium(rs.getInt(6));
                productSizeBean.setSmall(rs.getInt(7));

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return productSizeBean;
    }

    public ProductsBottomSizeBean productBottom(int productNum) {
        getCon();
        ProductsBottomSizeBean bottomSizeBean = new ProductsBottomSizeBean();
        try {
            String sql = "select * from productsbottom where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return bottomSizeBean;
    }

    public ProductsShoesBean productShoes(int productNum) {
        getCon();
        ProductsShoesBean shoesBean = new ProductsShoesBean();
        try {
            String sql = "select * from productshoes where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return shoesBean;
    }

    public int productUpdate(int productNum, ProductBean productBean) {
        getCon();
        try {
            String sql = "update products set brand = ?, productName = ?, ProductPrice = ?, " +
                    "productContent = ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, productBean.getBrand());
            pstmt.setString(2, productBean.getProductName());
            pstmt.setString(3, productBean.getProductPrice());
            pstmt.setString(4, productBean.getProductContent());
            pstmt.setInt(5, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int updateTop(ProductSizeBean productSizeBean, int productNum) {
        getCon();
        try {
            String sql = "update  productsTop set productName = ?,productColor = ?, " +
                    "XLarge = ? ,Large = ? , Medium = ? ,Small = ? where productNum = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, productSizeBean.getProductName());
            pstmt.setString(2, productSizeBean.getColor());
            pstmt.setInt(3, productSizeBean.getXLarge());
            pstmt.setInt(4, productSizeBean.getLarge());
            pstmt.setInt(5, productSizeBean.getMedium());
            pstmt.setInt(6, productSizeBean.getSmall());
            pstmt.setInt(7, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int updateBottom(ProductsBottomSizeBean bottomSizeBean, int productNum) {
        getCon();
        int num = 0;
        try {

            String sql = "update productsbottom set productName = ?, productColor = ?," +
                    "33size = ? , 32size = ? , 31size = ?, 30size = ? , 29size = ?," +
                    "28size = ? , 27size = ?, 26size = ?  where productNum = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bottomSizeBean.getProductName());
            pstmt.setString(2, bottomSizeBean.getColor());
            pstmt.setInt(3, bottomSizeBean.getSize33());
            pstmt.setInt(4, bottomSizeBean.getSize32());
            pstmt.setInt(5, bottomSizeBean.getSize31());
            pstmt.setInt(6, bottomSizeBean.getSize30());
            pstmt.setInt(7, bottomSizeBean.getSize29());
            pstmt.setInt(8, bottomSizeBean.getSize28());
            pstmt.setInt(9, bottomSizeBean.getSize27());
            pstmt.setInt(10, bottomSizeBean.getSize26());
            pstmt.setInt(11, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int updateShoes(ProductsShoesBean shoesBean, int productNum) {
        getCon();
        int num = 0;
        try {
            String sql = "update productshoes set productName = ?,productColor = ?," +
                    "290size = ?, 280size = ? ,270size = ? ,260size = ?, 250size = ?," +
                    "240size = ?, 23size = ?, 220size = ? where productNum = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, shoesBean.getProductName());
            pstmt.setString(2, shoesBean.getColor());
            pstmt.setInt(3, shoesBean.getSize290());
            pstmt.setInt(4, shoesBean.getSize280());
            pstmt.setInt(5, shoesBean.getSize270());
            pstmt.setInt(6, shoesBean.getSize260());
            pstmt.setInt(7, shoesBean.getSize250());
            pstmt.setInt(8, shoesBean.getSize240());
            pstmt.setInt(9, shoesBean.getSize230());
            pstmt.setInt(10, shoesBean.getSize220());
            pstmt.setInt(11, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public ThumbnailBean getOneThumbnail(int productNum) {
        getCon();
        ThumbnailBean thumbnailBean = new ThumbnailBean();
        try {
            String sql = "select * from thumbnail where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                thumbnailBean.setProductNum(rs.getInt(1));
                thumbnailBean.setProductName(rs.getString(2));
                thumbnailBean.setProductPrice(rs.getString(3));
                thumbnailBean.setProductColor(rs.getString(4));
                thumbnailBean.setThumbnail(rs.getString(5));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return thumbnailBean;
    }

    public int updateThumbnail(ThumbnailBean thumbnailBean) {
        getCon();
        try {
            String sql = "update thumbnail set productName = ?, " +
                    "   productPrice = ?," +
                    "   thumbnail = ? where productnum  = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, thumbnailBean.getProductName());
            pstmt.setString(2, thumbnailBean.getProductPrice());
            pstmt.setString(3, thumbnailBean.getThumbnail());
            pstmt.setInt(4, thumbnailBean.getProductNum());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int deleteProduct(int productNum) {
        getCon();
        try {
            String sql = "delete from products where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int deleteTop(int productNum) {
        getCon();
        try {
            String sql = "delete from productsTop where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int deleteBottom(int productNum) {
        getCon();
        try {
            String sql = "delete from productsbottom where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int deleteShoes(int productNum) {
        getCon();
        try {
            String sql = "delete from productshoes where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public int deleteThumbnail(int productNum) {
        getCon();
        try {
            String sql = "delete from thumbnail where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }

    public void insertPurchase(PurchaseBean purchaseBean) {
        getCon();
        int num = 1;
        try {
            String numSql = "select max(num) from purchaseList";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1) + 1;
            }
            String sql = "insert into purchaseList values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setInt(2,purchaseBean.getProductNum());
            pstmt.setString(3, purchaseBean.getThumbnail());
            pstmt.setInt(4, purchaseBean.getProductPrice());
            pstmt.setString(5, purchaseBean.getPurchaseId());
            pstmt.setString(6, purchaseBean.getPurchaseitem());
            pstmt.setInt(7, purchaseBean.getPurchasePrice());
            pstmt.setInt(8, purchaseBean.getPurchaseStock());
            pstmt.setString(9, purchaseBean.getPurchaseColor());
            pstmt.setString(10, purchaseBean.getPurchaseSize());
            pstmt.setString(11, purchaseBean.getPurchaseCategory());
            pstmt.setString(12, purchaseBean.getPostcode());
            pstmt.setString(13, purchaseBean.getAddress());
            pstmt.setString(14, purchaseBean.getPayment());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void stockUpdateTop1(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set small = small - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
    public void stockUpdateTop2(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set medium = medium - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void stockUpdateTop3(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set large = large - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void stockUpdateTop4(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set Xlarge = Xlarge - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }

    public void stockUpdateBottom1(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 26size = 26size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom2(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 27size = 27size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom3(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 28size = 28size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom4(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 29size = 29size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom5(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 30size = 30size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom6(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 31size = 31size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom7(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 32size = 32size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateBottom8(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 33size = 33size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes1(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 220size = 220size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes2(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 230size = 230size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes3(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 240size = 240size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes4(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 250size = 250size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes5(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 260size = 260size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes6(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 270size = 270size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes7(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 280size = 280size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockUpdateShoes8(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 290size = 290size - ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public int insertCart(CartBean cartBean){
        getCon();
        int num = 1;
        try {
            String numSql = "select max(num1) from cart";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1) + 1;
            }
            String sql ="insert into cart values(?,?,?,?,?,?,?,?,?,?,now())";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,cartBean.getNum());
            pstmt.setInt(2,num);
            pstmt.setString(3,cartBean.getId());
            pstmt.setString(4,cartBean.getThumbnail());
            pstmt.setString(5,cartBean.getProductname());
            pstmt.setString(6,cartBean.getProductColor());
            pstmt.setInt(7, cartBean.getPrice());
            pstmt.setString(8,cartBean.getSize());
            pstmt.setInt(9,cartBean.getStock());
            pstmt.setString(10,cartBean.getCategory());
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return 1;
    }
   public PurchaseBean getOnePurchase(int num){
        getCon();
        PurchaseBean purchaseBean = new PurchaseBean();
        try {
            String sql = "select * from purchaseList where num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                purchaseBean.setNum(rs.getInt(1));
                purchaseBean.setProductNum(rs.getInt(2));
                purchaseBean.setThumbnail(rs.getString(3));
                purchaseBean.setProductPrice(rs.getInt(4));
                purchaseBean.setPurchaseId(rs.getString(5));
                purchaseBean.setPurchaseitem(rs.getString(6));
                purchaseBean.setPurchasePrice(rs.getInt(7));
                purchaseBean.setPurchaseStock(rs.getInt(8));
                purchaseBean.setPurchaseColor(rs.getString(9));
                purchaseBean.setPurchaseSize(rs.getString(10));
                purchaseBean.setPurchaseCategory(rs.getString(11));
                purchaseBean.setPostcode(rs.getString(12));
                purchaseBean.setAddress(rs.getString(13));
                purchaseBean.setPayment(rs.getString(14));
                purchaseBean.setDate(rs.getString(15));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return purchaseBean;
   }


    public ArrayList<PurchaseBean> purchaseList(String id,int startRow,int endRow){
        getCon();
        ArrayList<PurchaseBean> list = new ArrayList<>();
        try{
            String sql = "select * from purchaselist where purchaseid = ? order by num desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                PurchaseBean purchaseBean = new PurchaseBean();
                purchaseBean.setNum(rs.getInt(1));
                purchaseBean.setProductNum(rs.getInt(2));
                purchaseBean.setThumbnail(rs.getString(3));
                purchaseBean.setProductPrice(rs.getInt(4));
                purchaseBean.setPurchaseId(rs.getString(5));
                purchaseBean.setPurchaseitem(rs.getString(6));
                purchaseBean.setPurchasePrice(rs.getInt(7));
                purchaseBean.setPurchaseStock(rs.getInt(8));
                purchaseBean.setPurchaseColor(rs.getString(9));
                purchaseBean.setPurchaseSize(rs.getString(10));
                purchaseBean.setPurchaseCategory(rs.getString(11));
                purchaseBean.setPostcode(rs.getString(12));
                purchaseBean.setAddress(rs.getString(13));
                purchaseBean.setPayment(rs.getString(14));
                purchaseBean.setDate(rs.getString(15));

                list.add(purchaseBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public ArrayList<CartBean> cartList(String id,int startRow,int endRow){
        ArrayList<CartBean> list = new ArrayList<>();
        getCon();
        try {
            String sql = "select * from cart where id = ? order by num1 desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                CartBean cartBean = new CartBean();
                cartBean.setNum(rs.getInt(1));
                cartBean.setNum1(rs.getInt(2));
                cartBean.setId(rs.getString(3));
                cartBean.setThumbnail(rs.getString(4));
                cartBean.setProductname(rs.getString(5));
                cartBean.setProductColor(rs.getString(6));
                cartBean.setPrice(rs.getInt(7));
                cartBean.setSize(rs.getString(8));
                cartBean.setStock(rs.getInt(9));
                cartBean.setCategory(rs.getString(10));
                cartBean.setDate(rs.getString(11));

                list.add(cartBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    public int cartDelete(int num){
        getCon();
        try {
            String sql ="delete from cart where num1 = ?";
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

    public int refundOrder(int num){
        getCon();
        try {
            String sql = "delete from purchaseList where num = ?";
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
    public void stockRefundTop1(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set small = small + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void stockRefundTop2(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set medium = medium + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void stockRefundTop3(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set large = large + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void stockRefundTop4(int stock, int num) {
        getCon();
        try {
            String sql = "update productstop set Xlarge = Xlarge + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }

    public void stockRefundBottom1(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 26size = 26size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom2(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 27size = 27size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom3(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 28size = 28size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom4(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 29size = 29size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom5(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 30size = 30size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom6(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 31size = 31size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom7(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 32size = 32size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundBottom8(int stock, int num) {
        getCon();
        try {
            String sql = "update productsbottom set 33size = 33size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes1(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 220size = 220size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes2(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 230size = 230size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes3(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 240size = 240size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes4(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 250size = 250size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes5(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 260size = 260size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes6(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 270size = 270size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes7(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 280size = 280size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }
    public void stockRefundShoes8(int stock, int num) {
        getCon();
        try {
            String sql = "update productshoes set 290size = 290size + ? where productNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
    public CartBean getOneCart(int num){
        getCon();
        CartBean cartBean = new CartBean();
        try{
            String sql = "select * from cart where num1 = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                cartBean.setNum(rs.getInt(1));
                cartBean.setNum1(rs.getInt(2));
                cartBean.setId(rs.getString(3));
                cartBean.setThumbnail(rs.getString(4));
                cartBean.setProductname(rs.getString(5));
                cartBean.setProductColor(rs.getString(6));
                cartBean.setPrice(rs.getInt(7));
                cartBean.setSize(rs.getString(8));
                cartBean.setStock(rs.getInt(9));
                cartBean.setCategory(rs.getString(10));
                cartBean.setDate(rs.getString(11));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return cartBean;
    }
    public int cartCount(String id){
        getCon();
        int cnt = 0;
        try {
            String sql = "select count(*) from cart where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return  cnt;
    }
    public int orderCount(String id){
        getCon();
        int cnt = 0;
        try {
            String sql = "select count(*) from purchaseList where purchaseId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return  cnt;
    }
    public int thumbCount(){
        getCon();
        int cnt = 0;
        try {
            String sql = "select count(*) from thumbnail ";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return  cnt;
    }
    public void insertRefund(PurchaseBean purchaseBean) {
        getCon();
        int num = 1;
        try {
            String numSql = "select max(num) from refund";
            pstmt = con.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1) + 1;
            }
            String sql = "insert into refund values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setInt(2,purchaseBean.getProductNum());
            pstmt.setString(3, purchaseBean.getThumbnail());
            pstmt.setInt(4, purchaseBean.getProductPrice());
            pstmt.setString(5, purchaseBean.getPurchaseId());
            pstmt.setString(6, purchaseBean.getPurchaseitem());
            pstmt.setInt(7, purchaseBean.getPurchasePrice());
            pstmt.setInt(8, purchaseBean.getPurchaseStock());
            pstmt.setString(9, purchaseBean.getPurchaseColor());
            pstmt.setString(10, purchaseBean.getPurchaseSize());
            pstmt.setString(11, purchaseBean.getPurchaseCategory());
            pstmt.setString(12, purchaseBean.getPostcode());
            pstmt.setString(13, purchaseBean.getAddress());
            pstmt.setString(14, purchaseBean.getPayment());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
    public int topAllListCount(){
        getCon();
        int count = 0;
        try {
            String sql = "select count(*) from thumbnail where category = 'top'";
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
    public ArrayList<ThumbnailBean> topAllList(int startRow,int endRow){
        getCon();
        ArrayList<ThumbnailBean> topAll = new ArrayList<>();
        try {
            String sql = "select * from thumbnail where category = 'top'order by productnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,startRow);
            pstmt.setInt(2,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ThumbnailBean thumbnailBean = new ThumbnailBean();
                thumbnailBean.setProductNum(rs.getInt(1));
                thumbnailBean.setProductName(rs.getString(2));
                thumbnailBean.setProductPrice(rs.getString(3));
                thumbnailBean.setProductColor(rs.getString(4));
                thumbnailBean.setThumbnail(rs.getString(5));
                thumbnailBean.setCategory(rs.getString(6));

                topAll.add(thumbnailBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return topAll;
    }
    public int bottomAllListCount(){
        getCon();
        int count = 0;
        try {
            String sql = "select count(*) from thumbnail where category = 'bottom'";
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
    public ArrayList<ThumbnailBean> bottomAllList(int startRow,int endRow){
        getCon();
        ArrayList<ThumbnailBean> bottomAll = new ArrayList<>();
        try {
            String sql = "select * from thumbnail where category = 'bottom'order by productnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,startRow);
            pstmt.setInt(2,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ThumbnailBean thumbnailBean = new ThumbnailBean();
                thumbnailBean.setProductNum(rs.getInt(1));
                thumbnailBean.setProductName(rs.getString(2));
                thumbnailBean.setProductPrice(rs.getString(3));
                thumbnailBean.setProductColor(rs.getString(4));
                thumbnailBean.setThumbnail(rs.getString(5));
                thumbnailBean.setCategory(rs.getString(6));

                bottomAll.add(thumbnailBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return bottomAll;
    }
    public int shoesAllListCount(){
        getCon();
        int count = 0;
        try {
            String sql = "select count(*) from thumbnail where category = 'shoes'";
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
    public ArrayList<ThumbnailBean> shoesAllList(int startRow,int endRow){
        getCon();
        ArrayList<ThumbnailBean> shoesAll = new ArrayList<>();
        try {
            String sql = "select * from thumbnail where category = 'shoes' order by productnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,startRow);
            pstmt.setInt(2,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ThumbnailBean thumbnailBean = new ThumbnailBean();
                thumbnailBean.setProductNum(rs.getInt(1));
                thumbnailBean.setProductName(rs.getString(2));
                thumbnailBean.setProductPrice(rs.getString(3));
                thumbnailBean.setProductColor(rs.getString(4));
                thumbnailBean.setThumbnail(rs.getString(5));
                thumbnailBean.setCategory(rs.getString(6));

                shoesAll.add(thumbnailBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return shoesAll;
    }
    public int searchCount(String search){
        getCon();
        int count = 0;
        try {
            String sql =   "select count(*) from thumbnail where productname like ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+search+"%");
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
    public ArrayList<ThumbnailBean> searchProducts(String search, int startRow,int endRow){
        ArrayList<ThumbnailBean> thumbnailBeans = new ArrayList<>();
        getCon();
        System.out.println(search);
        try {
            String sql = "select * from thumbnail where productname like ? order by productnum desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+search+"%");
            pstmt.setInt(2,startRow);
            pstmt.setInt(3,endRow);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ThumbnailBean thumbnailBean = new ThumbnailBean();
                thumbnailBean.setProductNum(rs.getInt(1));
                thumbnailBean.setProductName(rs.getString(2));
                thumbnailBean.setProductPrice(rs.getString(3));
                thumbnailBean.setProductColor(rs.getString(4));
                thumbnailBean.setThumbnail(rs.getString(5));
                thumbnailBean.setCategory(rs.getString(6));

                thumbnailBeans.add(thumbnailBean);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            close();
        }
        return thumbnailBeans;
    }
}
