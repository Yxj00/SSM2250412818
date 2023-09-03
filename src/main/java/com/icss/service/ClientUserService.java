package com.icss.service;

import com.icss.pojo.ClientUser;

import java.util.List;

public interface ClientUserService {
    void  insertClientUser(ClientUser clientUser);

    ClientUser login(String username, String password);
    List<ClientUser> findAll();

    Integer save(ClientUser clientUser);
}
