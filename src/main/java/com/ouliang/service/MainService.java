package com.ouliang.service;


import com.ouliang.dao.NodeDao;
import com.ouliang.dao.NoteTypeDao;
import com.ouliang.entity.Node;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class MainService {
    @Resource
    private NodeDao nodeDao;
    @Resource
    private NoteTypeDao nodeTypeDao;
    public List<Node> selectAllList(int page){
        List<Node> list= nodeDao.selectAll((page-1)*7);
        return list;
    }

    public Node selectById(String noteId) {
        int id=Integer.parseInt(noteId);
        Node node= nodeDao.selectById(id);
        return node;
    }

    public String selectType(int noteId) {
        String type=nodeTypeDao.selectByNoteIdToType(noteId);
        return type;
    }

    public int selectAllNum() {
        int i=nodeDao.selectAllNum();
        return i;
    }
}
