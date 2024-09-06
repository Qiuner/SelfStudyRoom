package com.example.springboot.service.impl;

import com.example.springboot.entity.Seat;
import com.example.springboot.mapper.SeatMapper;
import com.example.springboot.service.ISeatService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 座位管理 服务实现类
 * </p>
 *
 * @author 
 * @since 
 */
@Service
public class SeatServiceImpl extends ServiceImpl<SeatMapper, Seat> implements ISeatService {

}
