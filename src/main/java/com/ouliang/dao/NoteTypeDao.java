package com.ouliang.dao;

import com.ouliang.entity.Type;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoteTypeDao {
    String selectByNoteIdToType(int noteId);

    List<Type> selectAll();

    int deleteType(String typeId);

    int addType(String typeName);

    int changeType(String typeId, String typeName);
}
