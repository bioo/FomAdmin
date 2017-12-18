package com.fomagic.module.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.controller.BaseController;
import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.service.SysMenuService;

/**
 * 菜单
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys/menu")
public class SysMenuController extends BaseController {

	@Autowired
	SysMenuService sysMenuService;
	
	/**
	 * 菜单列表界面
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "/index" })
	public String menu() {

		return "sys/menu";
	}
	
	/**
	 * 获取所有菜单列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:menu:list")
	@RequestMapping("/list")
	@ResponseBody
	public List<SysMenu> listMenu() {
		List<SysMenu> menuList = sysMenuService.listMenu(new HashMap<String,Object>());
		
		return menuList;
	}
	
	/**
	 * 保存菜单
	 * @param sysMenu
	 * @return
	 */
	@RequiresPermissions("sys:menu:save")
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> saveMenu(@RequestBody SysMenu sysMenu) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		map=verifyForm(sysMenu);
		
		if (map.containsKey("msg")) {
			return map;
		}
		sysMenuService.saveMenu(sysMenu);
		map.put("code", 0);
		return map;
	} 
	
	/**
	 * 更新菜单
	 * @param sysMenu
	 * @return
	 */
	@RequiresPermissions("sys:menu:update")
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> updateMenu(@RequestBody SysMenu sysMenu){
		

		Map<String, Object> map = new HashMap<String,Object>();
		map=verifyForm(sysMenu);
		
		if (map.containsKey("msg")) {
			return map;
		}
		
		sysMenuService.updateMenu(sysMenu);
		
		map.put("code", 0);
		return map;
	}
	
	
	/**
	 * 删除菜单
	 * @param menuId
	 * @return
	 */
	@RequiresPermissions("sys:menu:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> deleteMenu(Long menuId) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		List<SysMenu> menuList = sysMenuService.listMenuIdByParentId(menuId);
		if (menuList.size()>0) {
			map.put("msg", "请先删除子菜单或按钮");
			return map;
		}
		
		sysMenuService.deleteBatchByMenuIds(new Long[]{menuId});
		
		map.put("code", 0);
		return map;
	}
	
	/**
	 * 选择菜单
	 * @return
	 */
	@RequiresPermissions("sys:menu:select")
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectMenu(){
		//查询不包含按钮的菜单列表
		List<SysMenu> menuList = sysMenuService.listNotButton();
		
		//添加一个顶级菜单目录
		SysMenu root = new SysMenu();
		root.setMenuId(0L);
		root.setName("一级菜单");
		root.setParentId(-1L);
		menuList.add(root);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("menuList", menuList);
		return map;
	}

	/**
	 * 单个菜单详情
	 * @return
	 */
	@RequiresPermissions("sys:menu:info")
	@RequestMapping("/info/{menuId}")
	@ResponseBody
	public Map<String, Object> infoMenu(@PathVariable("menuId") Long menuId){
		
		SysMenu menu = sysMenuService.getByMenuId(menuId);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("menu", menu);
		return map;
	}
	
	
	/**
	 * 验证参数是否正确
	 */
	private Map<String, Object> verifyForm(SysMenu menu){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("menu", menu);
		if (StringUtils.isBlank(menu.getName())) {
			map.put("msg", "菜单名称不能为空");
			return map;
		} 
		if (menu.getParentName()==null) {
			map.put("msg", "上级菜单不能为空");
			return map;
		} 
		//菜单
		if (menu.getType() == 1) {
			if (StringUtils.isBlank(menu.getUrl())) {
				map.put("msg", "菜单URL不能为空");
				return map;
			} 
		} 
		
		//上级菜单是目录类型
		int parentType = 0;
		if (menu.getParentId() != 0) {
			SysMenu parentMenu = sysMenuService.getByMenuId(menu.getParentId());
			parentType = parentMenu.getType();
		} 
		
		//目录、菜单
		if (menu.getType() == 0 || menu.getType() == 1) {
			if (parentType != 0) {
				map.put("msg", "菜单URL不能为空");
			}
			return map;
		}
		
		//按钮
		if (menu.getType() == 2) {
			if (parentType != 1) {
				map.put("msg", "按钮的上级只能为菜单");
			}
			return map;
		}
		
		return map;
		
	}
	
	
	
	
	
	
	
	
}