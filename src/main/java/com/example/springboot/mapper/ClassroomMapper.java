package com.example.springboot.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.springboot.entity.Classroom;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClassroomMapper extends BaseMapper<Classroom> {
}