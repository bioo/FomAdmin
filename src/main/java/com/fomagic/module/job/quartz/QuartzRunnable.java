package com.fomagic.module.job.quartz;

import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.ReflectionUtils;

import com.fomagic.common.exception.FomException;
import com.fomagic.common.util.SpringContextUtil;

/**
 * 执行定时任务
 * 
 * @author FOM
 *
 */
public class QuartzRunnable implements Runnable {
	private Object target;
	private Method method;
	private String params;
	
	public QuartzRunnable(String beanName, String methodName, String params) throws NoSuchMethodException, SecurityException {
		this.target = SpringContextUtil.getBean(beanName);
		this.params = params;
		
		if(StringUtils.isNotBlank(params)){
			this.method = target.getClass().getDeclaredMethod(methodName, String.class);
		}else{
			this.method = target.getClass().getDeclaredMethod(methodName);
		}
	}

	@Override
	public void run() {
		try {
			ReflectionUtils.makeAccessible(method);
			if(StringUtils.isNotBlank(params)){
				method.invoke(target, params);
			}else{
				method.invoke(target);
			}
		}catch (Exception e) {
			throw new FomException("执行定时任务失败", e);
		}
	}

}
