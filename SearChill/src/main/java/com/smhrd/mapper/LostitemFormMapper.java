package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Lostitem;

@Mapper
public interface LostitemFormMapper {

    public int insertLostitem(Lostitem lostitem);

    public List<Lostitem> getLostitemIsNull();

	public List<Lostitem> myLostItemNotice(String mem_id);

	public void deleteLostItem(String object_idx);

	public String findEmailByMemId(String mem_id);
    
}
