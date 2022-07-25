package com.ouliang.service;

import com.ouliang.dao.NodeDao;
import com.ouliang.dao.NoteTypeDao;
import com.ouliang.entity.Type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class NodeTypeService {
    @Resource
    private NoteTypeDao noteTypeDao;
    @Resource
    private NodeDao nodeDao;

    public List<Type> selectType() {
        List<Type> list=noteTypeDao.selectAll();
        return list;
    }

    public int changeNode(Map<String, String> map) {
        String string =map.get("content");
        String[] val = string.split("\r\n");
        string ="<p>";
        for (int i=0;i<val.length;i++){
            if (i==val.length-1){
                string+=val[i];
                string+="</p>";
                break;
            }
            string+=val[i];
            string+="</p>\r\n<p>";
        }
        map.put("content",string);
        int i=nodeDao.changeNode(map.get("noteId"),map.get("typeId"),map.get("title"),map.get("content"));
        return i;
    }

    public int addNote(Map<String, String> map) {
        String string =map.get("content");
        String[] val = string.split("\r\n");
        string ="<p>";
        for (int i=0;i<val.length;i++){
            if (i==val.length-1){
                string+=val[i];
                string+="</p>";
                break;
            }
            string+=val[i];
            string+="</p>\r\n<p>";
        }
        int i=nodeDao.addNode(map.get("title"),map.get("content"),map.get("typeId"),map.get("pubTime"));
        return 0;
    }


    public int deleteNodeById(String noteId) {
        return nodeDao.deleteNodeById(noteId);
        
    }


    public int deleteByTypeId(String typeId) {
        int i=nodeDao.selectByTypeId(typeId);
        if (i==0){
            i= noteTypeDao.deleteType(typeId);
            return i;
        }
        return 0;
    }

    public int addOrUpdate(Map<String, String> map) {
        int i=0;
        if (map.get("typeId")==""){
            i= noteTypeDao.addType(map.get("typeName"));
        }else {
            i=noteTypeDao.changeType(map.get("typeId"),map.get("typeName"));
        }
        return i;
    }
}
