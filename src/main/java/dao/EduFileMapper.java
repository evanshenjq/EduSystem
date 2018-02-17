package dao;

import bean.EduFile;
import bean.EduFileExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EduFileMapper {
    int countByExample(EduFileExample example);

    int deleteByExample(EduFileExample example);

    int deleteByPrimaryKey(Long fId);

    int insert(EduFile record);

    int insertSelective(EduFile record);

    List<EduFile> selectByExample(EduFileExample example);

    List<EduFile> selectAll(EduFileExample example);
    
    EduFile selectByPrimaryKey(Long fId);

    int updateByExampleSelective(@Param("record") EduFile record, @Param("example") EduFileExample example);

    int updateByExample(@Param("record") EduFile record, @Param("example") EduFileExample example);

    int updateByPrimaryKeySelective(EduFile record);

    int updateByPrimaryKey(EduFile record);
}