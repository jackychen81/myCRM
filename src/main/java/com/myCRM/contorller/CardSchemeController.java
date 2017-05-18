package com.myCRM.contorller;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.CardScheme;
import com.myCRM.po.User;
import com.myCRM.service.CardSchemeService;

@Controller
@RequestMapping("/admin/cardScheme")
public class CardSchemeController {

	@Autowired
	private CardSchemeService cardSchemeService;
	
	@RequestMapping("/list")
	public String list(){
		return "admin/cardScheme/list";
	}
	
	@RequestMapping("/listByPage")
	@ResponseBody
	public String listByPage(@RequestParam(required = false) String aoData){
		JSONObject cs = cardSchemeService.listByPage(aoData);
		return cardSchemeService.listByPage(aoData).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		CardScheme cardScheme = new CardScheme();
		model.addAttribute("cardScheme", cardScheme);
		return "admin/cardScheme/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(CardScheme cardScheme){
		try {
			cardSchemeService.add(cardScheme);
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
			cardSchemeService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable int id){
		CardScheme cardScheme = new CardScheme();
		cardScheme = cardSchemeService.findCardSchemeByUserId(id);
		model.addAttribute("cardScheme", cardScheme);
		return "admin/cardScheme/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(CardScheme cardScheme,@PathVariable int id){
		try {
			cardScheme.setId(id);
			cardSchemeService.update(cardScheme);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		
	}
	
}
