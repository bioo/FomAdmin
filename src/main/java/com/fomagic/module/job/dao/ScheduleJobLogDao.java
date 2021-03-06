package com.fomagic.module.job.dao;

import java.util.List;
import java.util.Map;

import com.fomagic.module.job.entity.ScheduleJobLog;

/**
 * 定时任务日志
 * 
 * @author FOM
 *
 */
public interface ScheduleJobLogDao {

	/**
	 * 根据任务ID获取任务信息
	 * 
	 * @param jobId
	 * @return
	 */
	ScheduleJobLog getByJobLogId(Long jobId);

	/**
	 * 获取任务日志列表
	 * 
	 * @param map
	 * @return
	 */
	List<ScheduleJobLog> listJobLog(Map<String, Object> map);

	/**
	 * 获取总数
	 * 
	 * @param map
	 * @return
	 */
	int countJobLog(Map<String, Object> map);

	/**
	 * 保存任务日志
	 * 
	 * @param log
	 */
	void saveJobLog(ScheduleJobLog log);

}
