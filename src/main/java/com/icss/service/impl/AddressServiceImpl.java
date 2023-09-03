package com.icss.service.impl;

import com.icss.mapper.AddressMapper;
import com.icss.pojo.Address;
import com.icss.service.AddressService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public void insertAddress(Address address) {
        addressMapper.addAddress(address);
    }
}
