package com.wl.school.custom.schoolIndexShow.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.schoolIndexShow.model.SchoolIndexShowVo;
import com.wl.school.custom.schoolIndexShow.service.SchoolIndexShowCustomService;

/*
 * author 王磊
 * 获取首页展示信息信息Action
 * date 2016-12-30
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/custom/schoolIndexShow")
public class SchoolIndexShowCustomAction {

	private static Logger logger = Logger.getLogger(SchoolIndexShowCustomAction.class);
	@Resource
	SchoolIndexShowCustomService schoolIndexShowCustomService;
	
	/**
	 * 首页获取最近的展示信息消息标题
	 * @return
	 */
	@RequestMapping("/getSchoolLastestIndexShow.ac")
	@ResponseBody
	public Map<String, Object> getSchoolLastestIndexShow(SchoolIndexShowVo schoolIndexShowVo){
		logger.info("获取首页展示信息");
		Map<String, Object> result = new HashMap<String, Object>();
		List<SchoolIndexShowVo> lstSchoolIndexShowVo = schoolIndexShowCustomService.getSchoolLastestIndexShow(schoolIndexShowVo);
		result.put("lstSchoolIndexShowVo", lstSchoolIndexShowVo);
		return result;
	}
	
	/**
	 * 获取展示信息列表
	 * @param schoolIndexShowVo
	 * @return
	 */
	@RequestMapping("/getSchoolIndexShowList.ac")
	@ResponseBody
	public Map<String, Object> getSchoolIndexShowList(SchoolIndexShowVo schoolIndexShowVo){
		logger.info("获取首页展示信息");
		Map<String, Object> result = new HashMap<String, Object>();
		int count = schoolIndexShowCustomService.getSchoolIndexShowCount(schoolIndexShowVo);
		List<SchoolIndexShowVo> lstSchoolIndexShowVo = new ArrayList<SchoolIndexShowVo>();
		if(count > 0){
			lstSchoolIndexShowVo = schoolIndexShowCustomService.getSchoolIndexShowList(schoolIndexShowVo);
		}
		result.put("totalCount", count);
		result.put("lstSchoolIndexShowVo", lstSchoolIndexShowVo);
		return result;
	}
	
	/**
	 * 根据id获取展示信息对象
	 * @param id
	 * @return
	 */
	@RequestMapping("/getSchoolIndexShowById.ac")
	@ResponseBody
	public SchoolIndexShowVo getSchoolIndexShowById(String id){
		logger.info("根据id获取首页展示信息");
		SchoolIndexShowVo result = schoolIndexShowCustomService.getSchoolIndexShowById(id);
		return result;
	}
}
