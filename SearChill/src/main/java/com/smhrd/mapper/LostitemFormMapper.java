package com.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Lostitem;

@Mapper
public interface LostitemFormMapper {

    public int insertLostitem(Lostitem lostitem);

    public Lostitem getLostitemById(String objectName);

    
    
}
