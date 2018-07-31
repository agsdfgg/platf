package com.mcwl.home_page;

import com.mcwl.home_page.entity.Game;
import com.mcwl.home_page.repository.GameRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HomePageApplicationTests {

    @Autowired
    GameRepository gameRepository;
    @Test
    public void contextLoads() {
        Game game = new Game();
        game.setAddress("测试地址");
        game.setDetails("测试详情");
        game.setName("测试名称");
        game.setOp("ios");
        game.setScore(45);
        gameRepository.save(game);
        //List<Game> list = gameRepository.findAll();
        //System.out.println(list.get(0).toString());
    }

}
