package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Classroom;
import com.example.springboot.mapper.ClassroomMapper;
import com.example.springboot.service.IClassroomService;
import org.springframework.stereotype.Service;

@Service
public class ClassroomServiceImpl extends ServiceImpl<ClassroomMapper, Classroom> implements IClassroomService {
}