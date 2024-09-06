package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.MessageBoard;
import com.example.springboot.mapper.MessageBoardMapper;
import com.example.springboot.service.IMessageBoardService;
import org.springframework.stereotype.Service;

@Service
public class MessageBoardServiceImpl extends ServiceImpl<MessageBoardMapper, MessageBoard> implements IMessageBoardService {
    // 实现自定义业务逻辑
}
