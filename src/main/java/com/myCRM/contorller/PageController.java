package com.myCRM.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	/*@Autowired
	private UserService userService;*/
	
	@RequestMapping("/home")
	public String home(){
		return "home";
	}
	
	@RequestMapping("/page/401")
	public String page401(){
		return "page/401";
	}
	
	@RequestMapping("/page/400")
	public String page400(){
		return "page/400";
	}
	
	@RequestMapping("/page/top")
	public String top(){
		return "top";
	}
	
	/*@RequestMapping("/101")
	public JSONObject page101(@RequestParam(required = false) String data){
		String key=null;
		String action = null;
		JSONObject jsonvalue = new JSONObject();
		JSONObject obju = new JSONObject();
		//System.out.println("data="+data);
		JSONObject jobj = JSONObject.fromObject(data);
		action = jobj.getString("action");
		//System.out.println("jobj size="+jobj.size());
		JSONObject jobjd = JSONObject.fromObject(jobj.get("data"));
			//System.out.println("jobjAction===="+jobj.get("action"));
			//System.out.println("jobjData===="+jobj.get("data"));
			Iterator iterator = jobjd.keys();
			while(iterator.hasNext()){
				key=(String) iterator.next();
				//System.out.println("key="+key);
				jsonvalue= (JSONObject) jobjd.get(key);
				//System.out.println("value="+jsonvalue);
			}
			//System.out.println(jsonvalue.get("username"));
			//System.out.println(jsonvalue.get("sp_pwd"));
			if(action.equals("edit")){
				System.out.println("edit!!!!");
			}else if(action.equals("remove")){
				System.out.println("remove!!!");
			}else{
				User u = (User) jsonvalue.toBean(jsonvalue, User.class);
				System.out.println(u);
				userService.add(u);
				User du = userService.findUserByUsername(u.getUsername());
				
				obju.put("data", JSONObject.fromObject(du));
				System.out.println("obju===="+obju);
				System.out.println("create!!!");
			}
			
		return obju;
	}
	
	
	@RequestMapping("/102")
	public void add(HttpServletRequest req,HttpServletResponse resp){
		Enumeration e = req.getParameterNames();
		while(e.hasMoreElements()){
			String key = (String) e.nextElement();
			
				String value = req.getParameter(key);
				System.out.println("value=="+value);
			
		}
	}*/
}
