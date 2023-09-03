package com.icss.mapper;

import com.icss.pojo.GoodS;
import com.icss.pojo.vo.GoodSCondition;

import java.util.List;

public interface GoodsKindMapper {

    List<GoodS> selectAll();
    List<GoodS> conditions(GoodSCondition condition);

    GoodS selectById(Integer id);
    void delete(int id);
}
