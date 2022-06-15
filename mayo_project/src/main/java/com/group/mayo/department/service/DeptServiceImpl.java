package com.group.mayo.department.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.mayo.department.dao.DeptDao;
import com.group.mayo.department.domain.Dept;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {
	
	@Autowired
	private DeptDao dao;
	
	@Override
	public List<Map<String,Object>> selectDeptList() {

		return dao.selectDeptList();
	}
	
}
