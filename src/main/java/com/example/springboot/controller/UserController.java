package com.example.springboot.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Constants;
import com.example.springboot.common.Result;
import com.example.springboot.config.interceptor.AuthAccess;
import com.example.springboot.controller.dto.UserDTO;
import com.example.springboot.controller.dto.UserPasswordDTO;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.service.IUserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author
 * 
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody UserDTO userDTO) {
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        UserDTO dto = userService.login(userDTO);
        return Result.success(dto);
    }

    @PostMapping("/register")
    public Result register(@RequestBody UserDTO userDTO) {
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        userDTO.setNickname(userDTO.getUsername());
        return Result.success(userService.register(userDTO));
    }

     // 新增或者更新
    @PostMapping
    public Result save(@RequestBody User user) {
        String username = user.getUsername();
        if (StrUtil.isBlank(username)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        if (StrUtil.isBlank(user.getNickname())) {
            user.setNickname(username);
        }
        if (user.getId() != null) {
            user.setPassword(null);
        } else {
            if (user.getPassword() == null) {
                user.setPassword("123");
            }
        }
        return Result.success(userService.saveOrUpdate(user));
    }
    /**
     * 修改密码
     *
     * @param userPasswordDTO
     * @return
     */
    @PostMapping("/password")
    public Result password(@RequestBody UserPasswordDTO userPasswordDTO) {
        userService.updatePassword(userPasswordDTO);
        return Result.success();
    }

    @AuthAccess
    @PutMapping("/reset")
    public Result reset(@RequestBody UserPasswordDTO userPasswordDTO) {
        if (StrUtil.isBlank(userPasswordDTO.getUsername()) || StrUtil.isBlank(userPasswordDTO.getPhone())) {
            throw new ServiceException("-1", "参数异常");
        }
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userPasswordDTO.getUsername());
        queryWrapper.eq("phone", userPasswordDTO.getPhone());
        List<User> list = userService.list(queryWrapper);
        if (CollUtil.isNotEmpty(list)) {
            User user = list.get(0);
            user.setPassword("123");
            userService.updateById(user);
        } else {
            return Result.error("-1", "未找到用户");
        }
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(userService.removeById(id));
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(userService.removeByIds(ids));
    }

    @GetMapping
    public Result findAll() {
        return Result.success(userService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(userService.getById(id));
    }

    @GetMapping("/username/{username}")
    public Result findByUsername(@PathVariable String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return Result.success(userService.getOne(queryWrapper));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String username,
                           @RequestParam(defaultValue = "") String email,
                           @RequestParam(defaultValue = "") String address) {

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(username)) {
            queryWrapper.like("username", username);
        }
        if (!"".equals(email)) {
            queryWrapper.like("email", email);
        }
        if (!"".equals(address)) {
            queryWrapper.like("address", address);
        }

        return Result.success(userService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


}

