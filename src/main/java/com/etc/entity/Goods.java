package com.etc.entity;

public class Goods {
    //id
    private Integer goods_id ;
    //名字
    private String goods_name;
    //图片
    private String pic;
    //生产日期
    private String production;
    //保质期
    private Integer guarantee;
    //单价
    private Double price;
    //余量
    private Integer counts;
    //备注
    private String mark;

    public Goods() {
    }

    public Goods(Integer goods_id, String goods_name, String pic, String production, Integer guarantee, Double price, Integer counts, String mark) {
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.pic = pic;
        this.production = production;
        this.guarantee = guarantee;
        this.price = price;
        this.counts = counts;
        this.mark = mark;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getProduction() {
        return production;
    }

    public void setProduction(String production) {
        this.production = production;
    }

    public Integer getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(Integer guarantee) {
        this.guarantee = guarantee;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCounts() {
        return counts;
    }

    public void setCounts(Integer counts) {
        this.counts = counts;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goods_id=" + goods_id +
                ", goods_name='" + goods_name + '\'' +
                ", pic='" + pic + '\'' +
                ", production='" + production + '\'' +
                ", guarantee=" + guarantee +
                ", price=" + price +
                ", counts=" + counts +
                ", mark='" + mark + '\'' +
                '}';
    }
}
