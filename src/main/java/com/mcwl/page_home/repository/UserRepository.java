package com.mcwl.page_home.repository;

import com.mcwl.page_home.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User,Long> {
}
