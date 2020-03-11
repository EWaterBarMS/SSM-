package com.etc.service;

import com.etc.entity.Goods;

import java.util.List;

public interface GoodsService {
    //查询所有货物
    List<Goods> query(Goods g);

    //加载单个货物
    Goods get(Integer gid);

    //添加货物
    boolean add(Goods g);

    //修改
    boolean mod(Goods g);

    //删除货物
    boolean del(Integer gid);
}
