package com.Manager;

public class TopTenBean {
    private int productnum;
    private String thumbnail;
    private String purchaseitem;
    private int productPrice;
    private String purchaseColor;
    private String purchaseCategory;
    private int sumProductSales;

    public int getSumProductSales() {
        return sumProductSales;
    }

    public void setSumProductSales(int sumProductSales) {
        this.sumProductSales = sumProductSales;
    }

    public int getProductnum() {
        return productnum;
    }

    public void setProductnum(int productnum) {
        this.productnum = productnum;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getPurchaseitem() {
        return purchaseitem;
    }

    public void setPurchaseitem(String purchaseitem) {
        this.purchaseitem = purchaseitem;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getPurchaseColor() {
        return purchaseColor;
    }

    public void setPurchaseColor(String purchaseColor) {
        this.purchaseColor = purchaseColor;
    }

    public String getPurchaseCategory() {
        return purchaseCategory;
    }

    public void setPurchaseCategory(String purchaseCategory) {
        this.purchaseCategory = purchaseCategory;
    }
}
