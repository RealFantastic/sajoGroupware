package com.group.mayo.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.mayo.schedule.domain.Schedule;
import com.group.mayo.schedule.model.dao.ScheduleDao;

@Service
@Transactional
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleDao dao;
	
	@Override
	public int insertSked(Schedule sked) {
		return dao.insertSked(sked);
	}

	@Override
	public List<Schedule> selectAllSked() {
		return dao.selectAllSked();
	}

	@Override
	public List<Schedule> selectSked(int proj_no) {
		return dao.selectSked(proj_no);
	}

	@Override
	public Schedule viewSked(int sked_no) {
		return dao.viewSked(sked_no);
	}
}
