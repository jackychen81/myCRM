package com.myCRM.contorller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.Business;
import com.myCRM.service.BusinessService;
import com.myCRM.tools.Utils;

@Controller
@RequestMapping("/business")
public class BusinessController{
	@Autowired
	private BusinessService businessService;
	
	@RequestMapping("/list")
	public String list() {
		return "business/list";
	}
	
	@RequestMapping("/listBusinessByPage")
	@ResponseBody
	public String listBusinessByPage(@RequestParam(required = false) String aoData) {
		return businessService.listBusinessByPage(aoData).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model) {
		Business business = new Business();
		model.addAttribute("business", business);
		return "business/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(Business business,Model model) {
		try {
			String bid= Utils.getUUID();
			business.setBid(bid);
			businessService.add(business);
			//model.addAttribute("bid", bid);
//			return "{\"flag\":\"true\",\"bid\":\""+bid+"\",\"cid\":\""+business.getCard().getCid()+"\"}".toString();
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@PathVariable String id) {
		try {
			businessService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}

	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable String id) {
		Business business= businessService.findBusinessById(id);
		model.addAttribute("business", business);
		return "business/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(Business business,@PathVariable String id) {
		try {
			business.setBid(id);
			businessService.add(business);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/listBusinessItemByPage/{bid}/{cid}",method=RequestMethod.GET)
	@ResponseBody
	public String listBusinessItemByPage(@PathVariable ("bid") String bid,@PathVariable ("cid") int cid) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("bid", bid);
		param.put("cid", cid);
		return businessService.listBusinessItemByPage(param).toString();
	}

	/*@RequestMapping("/list")
	public String list(){
		return "business/list";
	}
	
	@RequestMapping("/listBusinessByPage")
	@ResponseBody
	public String listBusinessByPage(@RequestParam(required = false) String aoData){
		return businessService.listBusinessByPage(aoData).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		User user = new User();
		model.addAttribute("user", user);
		return "admin/user/add";
	}*/
	
	
}
