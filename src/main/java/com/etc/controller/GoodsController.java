package com.etc.controller;

import com.etc.entity.Goods;
import com.etc.service.GoodsService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;


    //用户获取商品信息
    @RequestMapping("/query")
    public ModelAndView pageQuery(Goods g,
                                  @RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
                                  @RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("goodsList");
        PageInfo<Goods> p = goodsService.pageQuery(g,pageNum,pageSize);
        mv.addObject("p",p);
        mv.addObject("gname",g.getGoods_name());
        return mv;
    }

    /**
     * 查询所有
     * @return
     */
    @ResponseBody
    @GetMapping("/manage")
    public List<Goods> query(Goods g){
        return goodsService.query(g);
    }

    @ResponseBody
    @GetMapping("/manage/{gid}")
    public Goods get(@PathVariable("gid") Integer gid){
        return goodsService.get(gid);
    }

    @ResponseBody
    @PostMapping("/manage")
    public String add(Goods g, MultipartFile myfile, HttpServletRequest request){
        //上传图片并获得返回的文件名
        String filename = upload2(myfile,request);
        //设置图片
        g.setPic(filename);
        boolean res = goodsService.add(g);
        if(res) return "{\"msg\":\"添加成功！\"}";
        else return "{\"msg\":\"添加失败！\"}";
    }

    @ResponseBody
    @PostMapping("/managemod")
    public String update(Goods g, MultipartFile myfile, HttpServletRequest request){
        //上传图片并获得返回的文件名
        String filename = upload2(myfile,request);
        //设置图片
        if(filename!=null)
            g.setPic(filename);
        else
            g.setPic(goodsService.get(g.getGoods_id()).getPic());
        boolean res = goodsService.mod(g);
        if(res) return "{\"msg\":\"更新成功！\"}";
        else return "{\"msg\":\"更新失败！\"}";
    }

    @ResponseBody
    @DeleteMapping("/manage/{gid}")
    public String del(@PathVariable("gid") Integer gid,HttpServletRequest request){
        //  删除图片
        String pathFile = request.getSession().getServletContext().getRealPath("/");
        String filePath = pathFile+"uploadFile\\";
        String files = filePath+goodsService.get(gid).getPic();
        File f = new File(files);
        if(f.exists())
            f.delete();
        boolean res = goodsService.del(gid);
        if(res)
            return "{\"msg\":\"删除成功！\"}";
        else
            return "{\"msg\":\"删除失败！\"}";
    }

    //上传图片公用方法
    public String upload2(MultipartFile myfile, HttpServletRequest request){
        //  获取文件名
        if(myfile != null && myfile.getSize()!=0){
            String filename =  myfile.getOriginalFilename();
            /*filename.split(".");*/
            //  定义文件存储位置
            String pathFile = request.getSession().getServletContext().getRealPath("/");
            String filePath = pathFile+"uploadFile\\";
            File dirPath = new File(filePath);
            if (!dirPath.exists()) {
                dirPath.mkdirs();
            }
            //构建存储路径
            String files = filePath+filename;
            System.out.println("存储路径："+files);
            File file = new File(files);
            // 写入
            try {
                myfile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return filename;
        }
        return null;
    }


}
