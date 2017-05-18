package com.myCRM.contorller;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.Item;
import com.myCRM.service.ItemService;

@Controller
@RequestMapping("/admin/item")
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/list")
	public String list(){
		return "admin/item/list";
	}
	
	@RequestMapping("/listItemByPage")
	@ResponseBody
	public String listItemByPage(@RequestParam(required = false) String aoData,
		@RequestParam(required = false) String data){
		return itemService.listItemByPage(aoData).toString();
	}
	
	@RequestMapping(value="/listAllItem",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listAllItem(){
		return JSONArray.fromObject(itemService.list()).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		Item item = new Item();
		model.addAttribute("item", item);
		return "admin/item/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(Item item){
		try {
			itemService.add(item);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String update(Model model,@PathVariable int id){
		Item item = itemService.findItemById(id);
		model.addAttribute("item", item);
		return "admin/item/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(/*@RequestBody*/ Item item,@PathVariable int id/*,
			@RequestParam(required = false) String name,
			@RequestParam(required = false) Double price*/){
		try {
			item.setItemId(id);
			/*item.setName(name);
			item.setPrice(price);*/
			itemService.update(item);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable int id){
		try {
			itemService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
}
