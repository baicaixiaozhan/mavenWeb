package com.yj.dao;

import com.yj.po.Emp;
import com.yj.po.EmpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpMapper {
    long countByExample(EmpExample example);

    int deleteByExample(EmpExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Emp record);

    int insertSelective(Emp record);

    //无部门的查询
    List<Emp> selectByExample(EmpExample example);
    
    Emp selectByPrimaryKey(Integer empId);
    
    //有部门的查询
    List<Emp> selectByExampleWithDept(EmpExample example);

    Emp selectByPrimaryKeyWithDept(Integer empId);

    int updateByExampleSelective(@Param("record") Emp record, @Param("example") EmpExample example);

    int updateByExample(@Param("record") Emp record, @Param("example") EmpExample example);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);
}