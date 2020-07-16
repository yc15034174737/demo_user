package com.dj.ssm.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("show")
    public ResultModel show(UserQuery userQuery){
        try {
            Map<String, Object> map = new HashMap<>();
            IPage<User> userIPage = new Page<>(userQuery.getPageNo(),2);
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            if(userQuery.getUserName()!= null && userQuery.getUserName().length() != 0 ){
                queryWrapper.like("user_name",userQuery.getUserName());
            } if(userQuery.getSex()!= null  ){
                queryWrapper.eq("sex",userQuery.getSex());
            }
            IPage<User> userIPage1 = userService.page(userIPage, queryWrapper);

            map.put("userList", userIPage1.getRecords());
            map.put("pages", userIPage1.getPages());
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }

    }

    @PostMapping
    public ResultModel insert(@RequestBody User user){
        try {
            user.setCreateTime(new Date());
            userService.save(user);
            return new ResultModel().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    @PutMapping
    public ResultModel update(@RequestBody User user){
        try {
            userService.updateById(user);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    @DeleteMapping("{id}")
    public ResultModel delete(@PathVariable  Integer id){
        try {
            userService.removeById(id);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    @RequestMapping("inserts")
    public ResultModel inserts(UserQuery user){
        try {
            for (int i=0;i<user.getPl().size();i++){
                if (user.getPl().get(i) != null) {
                    user.getPl().get(i).setCreateTime(new Date());
                }
            }
            userService.saveBatch(user.getPl());
            return new ResultModel().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

}
