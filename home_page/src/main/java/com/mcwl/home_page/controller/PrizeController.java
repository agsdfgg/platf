package com.mcwl.home_page.controller;

import com.mcwl.home_page.dto.ResponseDto;
import com.mcwl.home_page.service.PrizeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jerry
 * @date 2018/7/18
 * @description积分商城controller
 */
@RestController
@RequestMapping("/prize")
public class PrizeController {
    @Autowired
    private PrizeServiceImpl prizeServiceImpl;
    @RequestMapping(value = "/allPrizes",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    private ResponseDto findAll(@RequestParam(name = "page") int page, @RequestParam(name = "size") int size){
        return prizeServiceImpl.queryAll(page, size);
    }

    @RequestMapping(value = "/sixPrizes",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    private ResponseDto findSix(){
        return prizeServiceImpl.getSix();
    }
}
