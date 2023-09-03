package com.icss.mapper;

import com.icss.pojo.Address;
import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
    void addAddress( Address address);

}
