package com.myCRM.contorller;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.Role;
import com.myCRM.service.RoleService;

@Controller
@RequestMapping("admin/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/list")
	public String list(){
		return "admin/role/list";
	}
	
	@RequestMapping("/listRoleByPage")
	@ResponseBody
	public String listRoleByPage(@RequestParam(required = false) String aoData,
			@RequestParam(required = false) String data){
		return roleService.listRoleByPage(aoData).toString();
		
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(Role role){
		try {
			roleService.add(role);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable int id){
		Role role = roleService.findRoleByRid(id);
		model.addAttribute("role", role);
		return "admin/role/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(Role role,@PathVariable int id){
		try {
			roleService.update(role);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@PathVariable int id){
		try {
			roleService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/initRole",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String initRole(){
		return JSONArray.fromObject(roleService.list()).toString();
	}
	
	@RequestMapping(value="/getRoles/{uid}",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getRoles(@PathVariable int uid){
		return JSONArray.fromObject(roleService.listUserRole(uid)).toString();
	}

	@RequestMapping(value="/addUserRole/{uid}/{rid}",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addUserRole(@PathVariable("uid") int uid,@PathVariable("rid") int rid){
		try {
			roleService.addUserRole(uid, rid);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	@RequestMapping(value="/deleteUserRole/{uid}/{rid}",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteUserRole(@PathVariable("uid") int uid,@PathVariable("rid") int rid){
		try {
			roleService.deleteUserRole(uid, rid);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	/**添加角色的权限*/
	@RequestMapping("/addRoleResource/{rId}")
	@ResponseBody
	public String addRoleResource(@PathVariable int rId,@RequestParam(required = false) int resId){
		try {
			roleService.addRoleResource(rId, resId);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	/**删除角色的权限*/
	@RequestMapping("/delRoleResource/{rId}")
	@ResponseBody
	public String delRoleResource(@PathVariable int rId,@RequestParam(required = false) int resId){
		try {
			roleService.deleteRoleResource(rId, resId);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
}
