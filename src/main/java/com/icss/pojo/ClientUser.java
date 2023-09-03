package com.icss.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.List;

/**
 * 客户表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientUser {
    private Integer userid;
    private String username;
    private String password;
    private Date joinDate;
    private String tel;
    private String pid;
    private String photo;
    //一个客户对应一个地址
//    private Address address;
}
