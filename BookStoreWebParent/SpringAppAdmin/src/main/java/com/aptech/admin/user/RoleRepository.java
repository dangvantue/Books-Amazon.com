package com.aptech.admin.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.aptech.common.entity.user.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Integer> {

}
