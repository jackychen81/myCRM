package com.myCRM.contorller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.CardCategory;
import com.myCRM.service.CardCategoryService;

@Controller
@RequestMapping("/admin/cardCategory")
public class CardCategoryController {
	@Autowired
	private CardCategoryService cardCategoryService;
	
	@RequestMapping("/list")
	public String list(){
		return "admin/cardCategory/list";
	}
	
	@RequestMapping(value="/listCardCategory",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listCardCategory(){
		JSONObject getObj = new JSONObject();
		getObj.put("data", JSONArray.fromObject(cardCategoryService.list()));
		return getObj.toString();
	}
	
	@RequestMapping(value="/listCategory",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listCategory(){
		return JSONArray.fromObject(cardCategoryService.list()).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "admin/cardCategory/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(CardCategory cardCategory){
		try {
			cardCategoryService.add(cardCategory);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable int id){
		CardCategory cardCategory=cardCategoryService.findCardCategoryById(id);
		model.addAttribute("cardCategory", cardCategory);
		return "admin/cardCategory/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(@PathVariable int id,CardCategory cardCategory){
		try {
			cardCategory.setCardCategoryId(id);
			cardCategoryService.update(cardCategory);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@PathVariable int id){
		try {
			cardCategoryService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
}
