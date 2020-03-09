package com.etc.test;

import com.etc.dao.GoodsDao;
import com.etc.entity.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "classpath:spring-mybatis.xml")
public class GoodsTest {

    @Autowired
    private GoodsDao goodsDao;

    @Test
    public void Test0(){
        /*查询测试*/
        //带条件查询
        Goods goods = new Goods();
        goods.setGoods_name("c");
        List<Goods> list1 = goodsDao.query(goods);
        for (Goods g:list1) {
            System.out.println("带条件查询结果："+g.toString());
        }
        //不带条件查询
        List<Goods> list2 = goodsDao.query(null);
        for (Goods g:list2) {
            System.out.println("不带条件查询结果："+g.toString());
        }
    }

    @Test
    public void Test1(){
        /*加载测试*/
        System.out.println(goodsDao.get(1));
    }
    @Test
    public void Test2(){
        /*添加测试*/
        Goods g = new Goods(null,"Cola",null,null,null,120.1,30,null);
        if(goodsDao.add(g)>0){
            System.out.println(g.getGoods_id()+"添加成功！");
        }else
            System.out.println("添加失败");
    }

    @Test
    public void Test3(){
        //修改测试
        Goods goods = goodsDao.get(3);
        goods.setPrice(3.5);
        int res = goodsDao.mod(goods);
        if(res>0)
            System.out.println("修改成功");
        else
            System.out.println("修改失败");
    }

    @Test
    public void Test4(){
        /* 删除测试*/
        int res = goodsDao.del(3);
        if(res>0)
            System.out.println("删除成功");
        else
            System.out.println("删除失败");
    }


}
