package com.example.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.springboot.entity.MessageBoard;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageBoardMapper extends BaseMapper<MessageBoard> {
}
