package com.myCRM.contorller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.Set;
import com.myCRM.service.SetService;

@Controller
@RequestMapping("/admin/set")
public class SetController {
	@Autowired
	private SetService setService;
	
	@RequestMapping("/list")
	public String list(){
		return "admin/set/list";
	}
	
	@RequestMapping("/listByPage")
	@ResponseBody
	public String listByPage(@RequestParam(required = false) String aoData){
		//JSONObject cs = setService.listByPage(aoData);
		return setService.listByPage(aoData).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		Set set = new Set();
		model.addAttribute("set", set);
		return "admin/set/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(Set set){
		try {
			set.setCreateDate(new Date());
			set.setUpdateDate(new Date());;
			setService.add(set);
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
			setService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable int id){
		Set set = new Set();
		set = setService.findSetById(id);
		model.addAttribute("set", set);
		return "admin/set/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(Set set,@PathVariable int id){
		try {
			set.setSetId(id);
			set.setUpdateDate(new Date());
			setService.update(set);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		
	}
}
