package com.icss.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GoodS {
    private Integer goodsid;
    private String goodsname;
    private String kind;
    private String model;
    private Float price;
    private String detail;
    private String img;
}
