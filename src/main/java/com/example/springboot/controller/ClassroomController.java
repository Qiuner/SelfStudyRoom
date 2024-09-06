package com.example.springboot.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Classroom;
import com.example.springboot.service.IClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/classroom")
public class ClassroomController {

    @Autowired
    private IClassroomService classroomService;

    @PostMapping
    public Result create(@RequestBody Classroom classroom) {
        classroomService.save(classroom);
        return Result.success(classroom);
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Long id) {
        Classroom classroom = classroomService.getById(id);
        if (classroom != null) {
            return Result.success(classroom);
        } else {
            return Result.error("404", "Classroom not found");
        }
    }

    @GetMapping
    public Result getAll() {
        List<Classroom> list = classroomService.list();
        return Result.success(list);
    }

    @PutMapping
    public Result update(@RequestBody Classroom classroom) {
        boolean updated = classroomService.updateById(classroom);
        if (updated) {
            return Result.success(classroom);
        } else {
            return Result.error("500", "Update failed");
        }
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        boolean removed = classroomService.removeById(id);
        if (removed) {
            return Result.success();
        } else {
            return Result.error("500", "Delete failed");
        }
    }

    @GetMapping("/page")
    public Result getPage(@RequestParam(defaultValue = "1") int page,
                          @RequestParam(defaultValue = "10") int size) {
        Page<Classroom> pageResult = classroomService.page(new Page<>(page, size));
        return Result.success(pageResult);
    }
    @DeleteMapping("/batch")
    public Result deleteBatch(@RequestBody List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return Result.error("400", "No IDs provided");
        }

        boolean removed = classroomService.removeByIds(ids);
        if (removed) {
            return Result.success();
        } else {
            return Result.error("500", "Batch delete failed");
        }
    }




}
