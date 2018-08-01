package com.mcwl.home_page.controller;

import com.mcwl.home_page.dto.ResponseDto;
import com.mcwl.home_page.service.GameServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jerry
 * @date 2018/7/18
 * 描述：
 * 手游controller
 * @description
 */
@RestController
@RequestMapping("/game")
public class GameController {

    @Autowired
    GameServiceImpl gameService;

    //查询所有游戏
    @RequestMapping(value = "/allGames",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    public ResponseDto getAllGame(@RequestParam(name = "page") int page,@RequestParam(name = "size") int size){
        return gameService.findAll(page,size);
    }

    //查询前6条数据
    @RequestMapping(value = "/sixGames",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    public ResponseDto getSix(){
        ResponseDto responseDto = new ResponseDto();
        responseDto.setData(gameService.findSix());
        return responseDto;
    }
}
