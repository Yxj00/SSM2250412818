package com.icss.service.impl;

import com.icss.mapper.ClientUserMapper;
import com.icss.pojo.ClientUser;
import com.icss.service.ClientUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClientUserServiceImpl implements ClientUserService {
    @Autowired
    private   ClientUserMapper clientUserMapper;
    @Override
    public void insertClientUser(ClientUser clientUser) {
        clientUserMapper.addClientUser(clientUser);
    }

    @Transactional(readOnly = true)
    public ClientUser login(String username, String password) {
        System.out.println(username);
        System.out.println(password);
        return clientUserMapper.selectByUsernamePassword(username,password);
    }

    @Override
    public List<ClientUser> findAll() {
        return clientUserMapper.selectAll();
    }

    @Override
    public Integer save(ClientUser clientUser) {
        return clientUserMapper.save(clientUser);
    }
}
