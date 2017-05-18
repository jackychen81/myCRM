package com.myCRM.contorller;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myCRM.po.Card;
import com.myCRM.service.CardService;

@Controller
@RequestMapping("/admin/card")
public class CardController {
	@Autowired
	private CardService cardService;
	
	@RequestMapping("/list")
	public String list(){
		return "admin/card/list";
	}
	
	@RequestMapping("/listCardByPage")
	@ResponseBody
	public String listCardByPage(@RequestParam(required = false) String aoData){
		return cardService.listCardByPage(aoData).toString();
	}
	
	@RequestMapping(value="/listCardByUid/{id}",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listCardByUid(@PathVariable int id,Model model){
		List<Card> card = cardService.listCardByUid(id);
		return JSONArray.fromObject(card).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		Card card = new Card();
		model.addAttribute("card", card);
		return "admin/card/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(Card card){
		try {
			cardService.add(card);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";//"redirect:admin/card/list";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable int id){
		model.addAttribute("card", cardService.findCardById(id));
		return "admin/card/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(Card card,@PathVariable int id){
		try {
			card.setCid(id);
			cardService.update(card);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
}
