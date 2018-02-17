package dao;

import bean.EduLab;
import bean.EduLabExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EduLabMapper {
    int countByExample(EduLabExample example);

    int deleteByExample(EduLabExample example);

    int deleteByPrimaryKey(Long lId);

    int insert(EduLab record);

    int insertSelective(EduLab record);

    List<EduLab> selectByExample(EduLabExample example);

    EduLab selectByPrimaryKey(Long lId);

    int updateByExampleSelective(@Param("record") EduLab record, @Param("example") EduLabExample example);

    int updateByExample(@Param("record") EduLab record, @Param("example") EduLabExample example);

    int updateByPrimaryKeySelective(EduLab record);

    int updateByPrimaryKey(EduLab record);
}