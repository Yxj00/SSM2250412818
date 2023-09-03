package com.icss.mapper;

import com.icss.pojo.ClientUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientUserMapper {
    /**
     * 添加用户
     */
    void  addClientUser(ClientUser clientUser);
    ClientUser selectByUsernamePassword(@Param("username") String username, @Param("password") String password);
    List<ClientUser> selectAll();

    Integer save(ClientUser clientUser);
}
