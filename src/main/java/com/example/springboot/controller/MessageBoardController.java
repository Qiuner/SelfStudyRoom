package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.MessageBoard;
import com.example.springboot.entity.User;
import com.example.springboot.service.impl.MessageBoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

import static com.example.springboot.utils.TokenUtils.getCurrentUser;

@RestController
@RequestMapping("/api/message-board")
public class MessageBoardController {

    @Autowired
    private MessageBoardServiceImpl messageBoardService;

    // 查询所有留言
    @GetMapping("/list")
    public Result getAllMessages() {
        List<MessageBoard> messages = messageBoardService.list();
        return Result.success(messages);
    }

    @PostMapping("/add")
    public Result addMessage(@RequestBody MessageBoard messageBoard) {
        User user = getCurrentUser();
        Integer userId = user.getId();
        String nickname = user.getNickname();

        System.out.println("-----------------------userid是" + Long.valueOf(userId) + "--------------------------------------");
        messageBoard.setUserId(Long.valueOf(userId));  // 设置 userId
        messageBoard.setNickname(nickname);
        messageBoard.setCreatedAt(LocalDateTime.now());
        messageBoard.setUpdatedAt(LocalDateTime.now());
        boolean saved = messageBoardService.save(messageBoard);

        if (saved) {
            return Result.success("留言成功");
        } else {
            return Result.error("500", "留言失败");
        }
    }

    // 删除留言
    @DeleteMapping("/delete/{id}")
    public Result deleteMessage(@PathVariable Long id) {
        boolean removed = messageBoardService.removeById(id);

        if (removed) {
            return Result.success("删除成功");
        } else {
            return Result.error("500", "删除失败");
        }
    }
}
