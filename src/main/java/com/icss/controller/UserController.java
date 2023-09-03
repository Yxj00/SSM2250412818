package com.icss.controller;


import com.github.pagehelper.PageInfo;
import com.icss.pojo.Address;
import com.icss.pojo.ClientUser;

import com.icss.pojo.GoodS;
import com.icss.pojo.vo.GoodSCondition;
import com.icss.service.AddressService;
import com.icss.service.ClientUserService;
import com.icss.service.GoodsKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private ClientUserService clientUserService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private GoodsKindService goodsKindService;
    static int i = 0;
    List<String> goodsNum = new ArrayList<String>();
    @RequestMapping("login")
    public String login(String username, String password, HttpSession httpSession, Model model, RedirectAttributes ra){
        ClientUser login = clientUserService.login(username, password);
        if(login == null){//登录失败
            model.addAttribute("loginInfo", "用户名或密码错误");
            return "login";
        }
        //重定向携带数据,可以在controller中获取参数
        ra.addAttribute("username", username);
        //在controller中不能获取，但是页面中可以直接使用。
        //把键值对存在临时的session中，传递一结束，session中的键值对就销毁
        ra.addFlashAttribute("password", password);
        //登录成功,将user存入session
        httpSession.setAttribute("user", login);
        //重定向又发送一次请求
//        return  "index";
        return "jump" ;
}

    @RequestMapping(value = "upload")
    public String uploadFile( MultipartFile file, HttpSession session,Model model,ClientUser clientUser,Address address
                           ) throws IllegalStateException, IOException{
        address.setUserid(clientUser.getUserid());
        addressService.insertAddress(address);
        // 1.文件名称
        String oldFileName = file.getOriginalFilename(); //获取上传文件的原名
        // 2.存储图片的物理路径
        String file_path = session.getServletContext().getRealPath("img/upload");
        // 3.上传图片
        if(file!=null && oldFileName!=null && oldFileName.length()>0){
            // 4.新的图片名称
            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            // 5.新图片
            File newFile = new File(file_path+"/"+newFileName);
            // 6.将内存中的数据写入磁盘
            file.transferTo(newFile);
            // 7.将文件名字保存到数据库，前端读取的时候会用到。或者可以把图片名称直接传给前端做一个图片的回显，这里大家自己操作。
            //下面是要保存在数据的库的路径==》upload/0d8a59b4ee3645b59461e34d2e176442.png
//            String imgAddress="upload/" + newFileName;
            //把图片的路径传回前端用来显示
            model.addAttribute("msg","注册成功");
            //把图片路径保存到数据库
            clientUser.setPhoto(newFileName);
//            clientUserService.save(clientUser);
            clientUserService.insertClientUser(clientUser);
        }
        return "jump";
    }


    @RequestMapping("list/{pageNum}/{pageSize}")
//    @ResponseBody
    public String userList(@PathVariable Integer pageNum,@PathVariable Integer pageSize, Model model){
        PageInfo<GoodS> pageInfo=goodsKindService.list(pageNum,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }
    @RequestMapping("list")
    public String goodsList(Model model){
        List<GoodS> goodSList = goodsKindService.list();
        model.addAttribute("goodSList",goodSList);
        return "index";
    }
    @GetMapping("conditions")
    public String conditions(GoodSCondition condition, Model model){
        List<GoodS> goodSList = goodsKindService.list(condition);
        model.addAttribute("goodSList",goodSList);
//        if (goodS.getKind().equals(""))return "jump";
        return "index";
//        return "jump";
    }
@RequestMapping("{goodsid}")
    public String selectById(@PathVariable Integer goodsid,Model model){
    GoodS byId = goodsKindService.findById(goodsid);
    model.addAttribute("byId", byId);
    return "detail1";
}
    @RequestMapping("goods/{goodsid}")
    public String index(@PathVariable String goodsid,Model model, HttpServletRequest request){
        PageInfo<GoodS> pageInfo = goodsKindService.list(1,6);
        model.addAttribute("pageInfo",pageInfo);
        goodsNum.add(goodsid);
        request.getSession().setAttribute("goodsNum",goodsNum);
        i++;
        request.getSession().setAttribute("shopNum",i);
        return "jump";
    }


    @RequestMapping("list1/{pageNum}/{pageSize}")
//    @ResponseBody
    public String goodsList(@PathVariable Integer pageNum,@PathVariable Integer pageSize, Model model) throws SQLException {
        List<ClientUser> all = clientUserService.findAll();
        model.addAttribute("all",all);
        PageInfo<GoodS> pageInfo=goodsKindService.list(pageNum,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        // 获取存储图像的BLOB字段
        return "shop";
    }
@RequestMapping("gwc")
    public String shopping(Model model){
    List<GoodS> goodSList = goodsKindService.list();
    model.addAttribute("goodSList",goodSList);
    return "jumpgwc";
}

    @DeleteMapping("{id}")
    public String delete(@PathVariable int id){
        goodsKindService.delete(id);
        return "redirect:/user/list/1/3";
    }

}
