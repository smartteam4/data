package com.cx.mapper;

import com.cx.pojo.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseMapper {

    // 查询所有课程信息
    public List<Course> findAll();

    // 查询课程信息
    public Course findByCId(Integer CId);

    // 获取课程总数
    public Integer getCourseCount();

    // 分页查询课程信息
    public List<Course> selectByPage(@Param("startPos") Integer startPos, @Param("pageSize") Integer pageSize);

    // 删除课程信息
    public Integer deleteCourse(Integer CId);

    // 管理员修改课程信息
    public Integer manageUpdate(Course course);

    // 模糊查询课程信息
    public List<Course> findByFuzzy(@Param("key")String key, @Param("value")String value);

    // 保存课程信息
    public Integer save(Course course);

    // 检查课程编号是否重复的方法
    public Integer checkCNum(String CNum);
}
