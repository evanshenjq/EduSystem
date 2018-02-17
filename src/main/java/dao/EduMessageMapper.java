package dao;

import bean.EduMessage;
import bean.EduMessageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EduMessageMapper {
    int countByExample(EduMessageExample example);

    int deleteByExample(EduMessageExample example);

    int deleteByPrimaryKey(Long mId);

    int insert(EduMessage record);

    int insertSelective(EduMessage record);

    List<EduMessage> selectByExample(EduMessageExample example);
    
    List<EduMessage> selectAll(EduMessageExample example);
    
    EduMessage selectByPrimaryKey(Long mId);

    int updateByExampleSelective(@Param("record") EduMessage record, @Param("example") EduMessageExample example);

    int updateByExample(@Param("record") EduMessage record, @Param("example") EduMessageExample example);

    int updateByPrimaryKeySelective(EduMessage record);

    int updateByPrimaryKey(EduMessage record);
    
    
}