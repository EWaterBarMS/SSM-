package com.etc.service;

import com.etc.entity.Goods;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface GoodsService {

    //分页加模糊查询
    PageInfo<Goods> pageQuery(Goods g,Integer pageNum,Integer pageSize);
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
