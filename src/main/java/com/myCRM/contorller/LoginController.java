package com.myCRM.contorller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myCRM.po.User;
import com.myCRM.service.UserService;


@Controller

public class LoginController {
	@Autowired
	private UserService userService;
	/*@Autowired
	private SessionDAO sessionDAO;*/
	
	@RequestMapping({"/index","/"})
	public String index(){
        return "index";
	}
	
	@RequestMapping("/login")
	public String login(Model model,@RequestParam (required = false) String kickout,
			@RequestParam (required = false) String aa){
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date date = new Date();
		System.out.println("aa:--------------"+aa);
		if(kickout!=null && kickout.equals("1")){
			model.addAttribute("kickoutMessage", "你已被踢出系统了！！�?");
//			Subject subject = SecurityUtils.getSubject();
//			subject.logout();
		}
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,Model model,HttpServletRequest request,HttpSession s){
		//System.out.println("进入login进程"+"username="+user.getUsername()+",userpwd="+user.getPassword());
		String url = "";
		String url2 = "";
		String emsg = null;
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			session.removeAttribute("kickout");
			UsernamePasswordToken token;
			String username = user.getUsername();
			User u = new User();
			
				u = userService.findUserByUsername(username);
				if(u!=null){
					username = u.getUsername();
				}
				token = new UsernamePasswordToken(username, user.getPassword());
			
			
			//记住我的处理
			/*if(user.isRemember()){
				token.setRememberMe(true);
			}else{
				token.setRememberMe(false);
			}*/
			
			subject.login(token);
			
			request.getSession().setAttribute("name", username/*user.getUsername()*/);
			request.getSession().setAttribute("user", u);
//			PrincipalCollection ps = subject.getPrincipals();
			//System.out.println(ps.asList());
			//System.out.println(ps.getRealmNames());
			
//			System.out.println("页面勾�?�记住我==="+user.isRemember());
//			System.out.println("subject.isAuthenticated()controller:"+subject.isAuthenticated());
//			System.out.println("subject.isRemembered()controller:"+subject.isRemembered());
			try {
				url = WebUtils.getSavedRequest(request).getRequestUrl();
//				System.out.println("登陆前访问的URL地址1111�?" + url+"====url长度�?"+url.length());//返回/owa/admin/user/list
				url2 = url.substring(url.indexOf("/", 2)+1, url.length());
//				System.out.println("登陆前访问的URL地址2222�?" + url2);//返回admin/user/list
			} catch (Exception e) {
				//e.printStackTrace();
				url2="index";
			}
		} catch (AuthenticationException e) {
			emsg=e.getMessage();
		}
		if(emsg!=null){
			model.addAttribute("emsg", emsg);
			return "login";
		}
		if(url2.equals("")||url2.length()==1){
//			System.out.println("只有/这个");
			return "index";//"index";//+url;
		}else{
//			System.out.println("url2是："+url2);
			return "redirect:"+url2;
		}
	}
	
	@RequestMapping("/logout")
	public String logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}
}
