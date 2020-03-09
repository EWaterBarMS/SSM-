package com.etc.dao;

import com.etc.entity.Goods;

import java.util.List;

public interface GoodsDao {

    //查询所有货物
    List<Goods> query(Goods g);

    //加载单个货物
    Goods get(Integer gid);

    //添加货物
    int add(Goods g);

    //修改
    int mod(Goods g);

    //删除货物
    int del(Integer gid);

}
