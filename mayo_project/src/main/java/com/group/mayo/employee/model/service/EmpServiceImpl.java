package com.group.mayo.employee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.mayo.employee.domain.Employee;
import com.group.mayo.employee.model.dao.EmpDao;

@Service
@Transactional
public class EmpServiceImpl implements EmpService{
	@Autowired
	private EmpDao dao;
	
	public List<Employee> selectListEmp() {
		return dao.selectListEmp();
	}


}