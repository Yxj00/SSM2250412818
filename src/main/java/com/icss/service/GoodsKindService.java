package com.icss.service;

import com.github.pagehelper.PageInfo;
import com.icss.pojo.GoodS;
import com.icss.pojo.GoodsKind;
import com.icss.pojo.vo.GoodSCondition;

import java.util.List;

public interface GoodsKindService {
    List<GoodS> list(GoodSCondition condition);
    List<GoodS> list();

    PageInfo<GoodS> list(Integer pageNum, Integer pageSize);

    GoodS findById(Integer id);
    void delete(int id);
}
