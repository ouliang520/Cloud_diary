package com.ouliang.dao;

import com.ouliang.entity.Node;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NodeDao {
    List<Node> selectAll(int page);

    Node selectById(int id);


    int selectAllNum();

    int changeNode(String noteId, String typeId, String title, String content);

    int addNode(String title, String content, String typeId, String pubTime);

    int deleteNodeById(String noteId);

    int selectByTypeId(String typeId);
}
