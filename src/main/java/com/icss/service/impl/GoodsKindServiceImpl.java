package com.icss.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icss.mapper.GoodsKindMapper;

import com.icss.pojo.GoodS;
import com.icss.pojo.vo.GoodSCondition;
import com.icss.service.GoodsKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GoodsKindServiceImpl implements GoodsKindService {
    @Autowired
    private GoodsKindMapper goodsKindMapper;


    @Override
    public List<GoodS> list(GoodSCondition condition) {
        return goodsKindMapper.conditions(condition);
    }

    @Override
    public List<GoodS> list() {
        return goodsKindMapper.selectAll();
    }

    @Override
    public PageInfo<GoodS> list(Integer pageNum, Integer pageSize) {
        // 开启分页
        PageHelper.startPage(pageNum,pageSize);
        // 执行分页
        PageInfo<GoodS> pageInfo=new PageInfo<>(goodsKindMapper.selectAll());
        return pageInfo;
    }

    @Override
    public GoodS findById(Integer id) {
        return goodsKindMapper.selectById(id);
    }

    @Override
    public void delete(int id) {
    goodsKindMapper.delete(id);
    }
}
