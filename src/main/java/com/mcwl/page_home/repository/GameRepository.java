package com.mcwl.page_home.repository;

import com.mcwl.page_home.entity.Game;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GameRepository extends PagingAndSortingRepository<Game,Long> {

    /**
     * 分页获取信息
     * @param pageable
     * @return
     */
    @Override
    Page<Game> findAll(Pageable pageable);
}
