package com.mcwl.home_page.controller;

import com.mcwl.home_page.dto.ResponseDto;
import com.mcwl.home_page.entity.Enums;
import com.mcwl.home_page.entity.Task;
import com.mcwl.home_page.service.TaskServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Jerry
 * @date 2018/7/18
 * @description 首页任务controller
 */
@RestController
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private TaskServiceImpl taskServiceImpl;

    //响应实体类
    ResponseDto responseDto = new ResponseDto();

    @Autowired
    Enums enums;

    //我的任务查询
    @RequestMapping(value = "all",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    public ResponseDto getTaskByUserId(@RequestParam(name = "userId") int userId){
        List<Task> list = taskServiceImpl.getTaskByUserId(userId);
        responseDto.setData(list);
        responseDto.setCode(enums.getSuccessCode());
        return responseDto;
    }

    //任务奖励领取
    @RequestMapping(value = "reward",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    public ResponseDto getPrize(@RequestParam(name = "userId") int userId,@RequestParam(name = "taskId") int taskId){
        Boolean bool = taskServiceImpl.reward(userId,taskId);
        if (bool){
            responseDto.setMessage("领取成功");
            //200
            responseDto.setCode(enums.getSuccessCode());
        }else{
            responseDto.setMessage("领取失败");
            //201
            responseDto.setCode(enums.getRollbackCode());
        }
        return responseDto;
    }
}
