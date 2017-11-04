package com.wl.school.admin.account.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.account.service.IAccountService;
import com.wl.school.admin.login.action.AdminLoginAction;
import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.admin.login.service.IAdminLoginService;
import com.wl.school.common.utils.SessionUtils;

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/admin/account")
public class AccountAction {

	private static Logger logger = Logger.getLogger(AdminLoginAction.class);
	
	@Resource
	private IAccountService accountService;
	
	@Resource
	private IAdminLoginService adminLoginService;
	
	@RequestMapping("/getAccountById.ac")
	@ResponseBody
	public AdminUserVo getAccountById(String id){
		logger.info("根据id获取账号信息");

		AdminUserVo result = accountService.getAdminUserById(id);
		
		return result;
	}
	
	@RequestMapping("/addAcount.ac")
	public String addAccount(AdminUserVo adminUserVo, HttpServletRequest request){
		logger.info("添加管理员账号");
		//先判断是否有相同账号
		int addResult = 0;
		String error = "";
		String userName = adminUserVo.getUserName();
		if(userName != null && userName != ""){
		    AdminUserVo user = adminLoginService.getAdminUserByUserName(adminUserVo.getUserName());
			if(user == null){
				addResult = accountService.addAdminUser(adminUserVo);
			}else{
				error = "添加失败，该账号已注册！";
			}
		}else{
			error = "添加失败，账号不能为空！";
		}
		if(addResult == 1){
			return "/admin/account/accountList";
		}else{
			if("".equals(error)){
				error = "添加失败";
			}
			request.setAttribute("error", error);
			return "/admin/account/accountAdd";
		}
	}
	
	@RequestMapping("/modifyAcount.ac")
	public String modifyAccount(AdminUserVo adminUserVo, String oldPassword, HttpServletRequest request){
		logger.info("修改管理员账号");
		int updateResult = 0;
		AdminUserVo currentUser = (AdminUserVo) SessionUtils.getObjectFromSession(SessionUtils.CURRENT_USER);
		String currentPw = currentUser.getPassword();
		String error = "";
		if(currentPw.equals(oldPassword)){
			updateResult = accountService.updateAdminUser(adminUserVo);
			if(updateResult == 1){
				SessionUtils.addObjectToSession(SessionUtils.CURRENT_USER, adminUserVo);
			}else{
				error = "更新失败";
			}
		}else{
			error = "操作人登陆密码输入错误";
		}
		request.setAttribute("error", error);
		return "/admin/account/accountDetail";
	}
	
	@RequestMapping("/getAccountList.ac")
	@ResponseBody
	public Map<String, Object> getAccountList(AdminUserVo adminUserVo){
		logger.info("获取账号列表");
		Map<String, Object> result = new HashMap<String, Object>();
		int count = accountService.getAdminUserCount(adminUserVo);
		List<AdminUserVo> lstAccount = new ArrayList<AdminUserVo>();
		if(count > 0){
			lstAccount = accountService.getAdminUserList(adminUserVo);
		}
		result.put("totalCount", count);
		result.put("lstAccount", lstAccount);
		
		return result;
	}
	
	@RequestMapping("/deleteAccount.ac")
	@ResponseBody
	public Map<String, Object> deleteAccount(@RequestParam("ids[]")List<String> ids){
		logger.info("删除管理员账号");
		Map<String, Object> result = new HashMap<String, Object>();
		int deleteResult = 0;
		String msg = "";
		//检查是否包含了自身超级管理员账号
		AdminUserVo currentUser = (AdminUserVo) SessionUtils.getObjectFromSession(SessionUtils.CURRENT_USER);
		String currentUserId = currentUser.getId();
		if(ids.contains(currentUserId)){
			msg = "不能删除超级管理员账号！";
		}else{
			deleteResult = accountService.deleteAdminUser(ids);
		}
		result.put("result", deleteResult);
		result.put("msg", msg);
		return result;
	}
}
