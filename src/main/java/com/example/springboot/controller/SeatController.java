package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Constants;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Seat;
import com.example.springboot.entity.User;
import com.example.springboot.service.ISeatService;
import com.example.springboot.service.IUserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 座位管理 前端控制器
 * </p>
 *
 * @author 
 * @since 
 */
@RestController
@RequestMapping("/seat")
public class SeatController {

    @Resource
    private ISeatService seatService;
    @Resource
    IUserService userService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Seat seat) {
        if (seat.getId() == null) {
            //seat.setTime(DateUtil.now());
            //seat.setUserName(TokenUtils.getCurrentUser().getNickname());
            //seat.setUserId(TokenUtils.getCurrentUser().getId());
            seat.setState("否");
        }
        seatService.saveOrUpdate(seat);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        seatService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        seatService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(seatService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(seatService.getById(id));
    }

    @GetMapping("/order/{id}")
    public Result order(@PathVariable Integer id) {
        LambdaQueryWrapper<Seat> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Seat::getId,id);
        wrapper.eq(Seat::getState,"是");
        Seat one = seatService.getOne(wrapper);
        if (one!=null){
            if (one.getUserId()==TokenUtils.getCurrentUser().getId()){
                return Result.error(Constants.CODE_600,"您已经预订过这个座位了");
            }else {
                return Result.error(Constants.CODE_600,"已有别的用户预订过这个座位了");
            }
        }
        Seat seat = seatService.getById(id);
        seat.setUserId(TokenUtils.getCurrentUser().getId());
        seat.setUserName(TokenUtils.getCurrentUser().getNickname());
        seat.setState("是");
        seatService.updateById(seat);
        return Result.success();
    }

    @GetMapping("/cancel/{id}")
    public Result cancel(@PathVariable Integer id) {
        LambdaUpdateWrapper<Seat> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(Seat::getId,id);
        wrapper.set(Seat::getUserId,null);
        wrapper.set(Seat::getUserName,null);
        wrapper.set(Seat::getState,"否");
        seatService.update(wrapper);
        return Result.success();
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Seat> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("userid", currentUser.getId());
//        }
        return Result.success(seatService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

