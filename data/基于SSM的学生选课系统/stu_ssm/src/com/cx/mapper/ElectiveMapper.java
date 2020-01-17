package com.cx.mapper;

import com.cx.pojo.Elective;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ElectiveMapper {

    // 通过UId查找选课信息
    public Elective findByUId(Integer UId);

    // 保存选课信息
    public Integer save(Elective elective);

    // 删除选课信息
    public Integer delete(Integer EId);

    // 查询选课总记录
    public Integer getElectiveCount();

    // 查询所有选课信息
    public List<Elective> selectElectiveByPage(@Param("startPos") Integer startPos, @Param("pageSize") Integer pageSize);

    // 通过UId删除选课信息
    public Integer deleteByUId(Integer UId);

    // 模糊查询选课信息
    public List<Elective> findByFuzzy(@Param("key")String key, @Param("value")String value);

}
