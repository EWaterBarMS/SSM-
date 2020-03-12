package com.etc.service.impl;

import com.etc.dao.GoodsDao;
import com.etc.entity.Goods;
import com.etc.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl  implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public PageInfo<Goods> pageQuery(Goods g, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Goods> list = goodsDao.query(g);
        PageInfo<Goods> p = new PageInfo<>(list);
        return p;
    }

    @Override
    public List<Goods> query(Goods g) {
        return goodsDao.query(g);
    }

    @Override
    public Goods get(Integer gid) {
        return goodsDao.get(gid);
    }

    @Override
    public boolean add(Goods g) {
        return goodsDao.add(g)>0 ? true : false;
    }

    @Override
    public boolean mod(Goods g) {
        return goodsDao.mod(g)>0 ? true : false;
    }

    @Override
    public boolean del(Integer gid) {
        return goodsDao.del(gid)>0 ? true : false;
    }
}
