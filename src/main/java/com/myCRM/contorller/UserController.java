package com.myCRM.contorller;

import java.util.ArrayList;
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

import com.myCRM.po.User;
import com.myCRM.service.RoleService;
import com.myCRM.service.UserService;
import com.myCRM.tools.GetPrincipal;


@Controller
@RequestMapping("admin/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private GetPrincipal getPrincipal;
	
	@RequestMapping(value="/listUsers",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listUsers(){
		return JSONArray.fromObject(userService.list()).toString();
	}
	
	@RequestMapping("/list")
	public String list(){
		return "admin/user/list";
	}
	@RequestMapping("/listUserByPage")
	@ResponseBody
	public String listUserByPage(@RequestParam(required = false) String aoData,
			@RequestParam(required = false) String data){
			return userService.listUserByPage(aoData).toString();
	}
	/**
	 * @author Administrator
	 * @param
	 * @see
	 * 在@RequestMapping中添加produces = "text/html;charset=UTF-8"
	 * 解决返回JSON给页面是中文乱码显示�?
	 * */
	@RequestMapping(value="/listAll",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listAll(){
		List<User> users = new ArrayList<User>();
		users = userService.list();
		return JSONArray.fromObject(users).toString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		User user = new User();
		model.addAttribute("user", user);
		return "admin/user/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(User user){
		try {
			userService.add(user);
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
			userService.delete(id);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(Model model,@PathVariable int id){
		User user = new User();
		user = userService.findUserByUserId(id);
		model.addAttribute("user", user);
		return "admin/user/update";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public String update(User user,@PathVariable int id){
		try {
			user.setId(id);
			userService.update(user);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		
	}
	
	
	/*@RequestMapping(value="/listAll4Select/{id}",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listAll4Select(@PathVariable int id){
		return userService.rightUser(id).toString();
	}*/
	/**添加�?属经理手下的用户*/
	/*@RequestMapping(value="/addStaff4Manager/{managerId}",method=RequestMethod.POST)
	@ResponseBody
	public String addStaff4Manager(@PathVariable int managerId,@RequestBody User[] member){
		userService.addStaff4Manager(managerId, member);
		return member.toString();
	}*/
	/*public String addStaff4Manager(@RequestParam(required = false) String member,@PathVariable int id){
		userService.addStaff4Manager(member, id);
		return "redirect:/admin/user/list";
	}*/
	/**移除�?属经理手下的用户*/
	/*@RequestMapping(value="/removerStaff4Manager",method=RequestMethod.POST)
	@ResponseBody
	public String removerStaff4Manager(@RequestBody User[] removeTempData){
		userService.removerStaff4Manager(removeTempData);
		return removeTempData.toString();
	}*/
	
	/*@RequestMapping("/findByUsername")
	public String findByUsername(Model model,String sp_name){
		User u = new User();
		u= userService.findUserByUsername(sp_name);
		System.out.println("user is="+u);
		model.addAttribute("user", u);
		return "admin/user/find";
	}*/
	
	/*@RequestMapping(value="/findByUsername/{username}",method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findByUsername(@PathVariable String username){
		System.out.println("username is="+username);
		User u = new User();
		u= userService.findUserByUsername(username);
		System.out.println("user is="+u);
		return JSONObject.fromObject(u).toString();
	}*/
	
	
	
	/*@RequestMapping(value="/listSales",method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listSales(Model model){
		List<User> sales = userService.listSales();
		JSONArray arr = new JSONArray();
		JSONArray.fromObject(sales);
		return JSONArray.fromObject(sales).toString();
	}*/
	
	/**上传头像*/
/*	@RequestMapping(value="/uploadImg",method=RequestMethod.POST)
	public String uploadImg(@RequestParam(value = "file", required = false) MultipartFile file, 
			HttpServletRequest request){
		String uploadPath = config.getUploadPath();
		System.out.println("uploadPath=="+uploadPath);
		String fileName = getPrincipal.initSubject();
				//+System.currentTimeMillis();
//		String type = file.getContentType();
//		System.out.println("type=="+type);
		String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
		System.out.println("type=="+type);
		uploadPath = uploadPath+fileName+type;
		//String tempPath = "/resources/image/temp/"+fileName+type;
		//String uri = request.getSession().getServletContext().getRealPath(realPath);
//		String uri = this.getClass().getClassLoader().getResource("/").getPath();
		System.out.println("uploadPath=="+uploadPath);
		try {
			file.transferTo(new File(uploadPath));
			User u = userService.findUserByUsername(getPrincipal.initSubject());
			u.setImgUrl("/"+fileName+type);
			userService.update(u);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/user/list";
	}
*/	

}
