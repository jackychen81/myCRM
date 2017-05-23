package com.myCRM.contorller;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.Resource;
import com.myCRM.service.ResourceService;


@Controller
@RequestMapping("admin/resource")
public class ResourceController {
	@Autowired
	private ResourceService resourceService;
	@RequestMapping("/list")
	public String list(){
		return "admin/resource/list";
	}
	
	@RequestMapping(value="/listRoleResByRoleId/{rid}",method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listRoleResByRoleId(@PathVariable int rid){
		return resourceService.listResourceByRoleId(rid).toString();
	}
	
	@RequestMapping(value="/listResource",method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listResource(){
		List<Resource> res = resourceService.list();
		//System.out.println(res.toString());
		JSONObject getObj = new JSONObject();
		getObj.put("data", JSONArray.fromObject(res));
		return getObj.toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		Resource res = new Resource();
		model.addAttribute("resource", res);
		return "admin/resource/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Model model,Resource res){
		resourceService.add(res);
		return "redirect:/admin/resource/list";
	}
	
	@RequestMapping("/addResource")
	@ResponseBody
	public String addResource(@RequestParam(required = false) String name,
			@RequestParam(required = false) int resId,
			@RequestParam(required = false) int resPid){
		Resource res = new Resource();
		res.setName(name);
		res.setResId(resId);
		res.setResPid(resPid);
		try {
			resourceService.add(res);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping("/update/{resId}")
	@ResponseBody
	public String update(@RequestParam(required = false) String url,
			@RequestParam(required = false) String name,
			@RequestParam(required = false) Boolean nocheck,
			@PathVariable int resId){
		Resource res = new Resource();
		res.setResId(resId);
		res.setName(name);
		res.setUrl(url);
		if(nocheck!=null) res.setNocheck(nocheck);
		try {
			resourceService.update(res);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/delete/{resId}",method=RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable int resId){
		try {
			resourceService.delete(resId);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
}
