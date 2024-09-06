package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("classroom")
public class Classroom {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private String location;
    private String details;
    private Integer totalSeats;
    private Integer occupiedSeats;
}