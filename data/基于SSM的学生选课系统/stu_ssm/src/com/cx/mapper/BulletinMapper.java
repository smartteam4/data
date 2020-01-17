package com.cx.mapper;

import com.cx.pojo.Bulletin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BulletinMapper {

    // 查询所有公告
    public List<Bulletin> findAll();

    // 分页查询课程信息
    public List<Bulletin> selectByPage(@Param("startPos") Integer startPos, @Param("pageSize") Integer pageSize);

    // 获取课公告总数
    public Integer getBulletinCount();

    // 通过ID查找公告
    public Bulletin findByBId(Integer BId);

    // 模糊查询公告信息
    public List<Bulletin> findByFuzzy(@Param("key")String key, @Param("value")String value);

    // 删除公告的方法
    public Integer delete(Integer BId);

    // 更新公告的方法
    public Integer update(Bulletin bulletin);
    // 保存公告的方法
    public Integer save(Bulletin bulletin);

}
