package dao;

import bean.EduStudent;
import bean.EduStudentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EduStudentMapper {
    int countByExample(EduStudentExample example);

    int deleteByExample(EduStudentExample example);

    int deleteByPrimaryKey(Long sId);

    int insert(EduStudent record);

    int insertSelective(EduStudent record);

    List<EduStudent> selectByExample(EduStudentExample example);

    EduStudent selectByPrimaryKey(Long sId);

    int updateByExampleSelective(@Param("record") EduStudent record, @Param("example") EduStudentExample example);

    int updateByExample(@Param("record") EduStudent record, @Param("example") EduStudentExample example);

    int updateByPrimaryKeySelective(EduStudent record);

    int updateByPrimaryKey(EduStudent record);
}