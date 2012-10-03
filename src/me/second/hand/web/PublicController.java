package me.second.hand.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PublicController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String publicIndex(Model model){
		return "redirect:/index";
	}
	
	@RequestMapping(value="/system", method=RequestMethod.GET)
	public String systemPublic(Model model){
		return "system/tems";
	}
	
	@RequestMapping(value="/about", method=RequestMethod.GET)
	public String systemAbout(Model model){
		return "system/about";
	}
	
	@RequestMapping(value="/user", method=RequestMethod.GET)
	public String userPublic(Model model){
		return "user/login";
	}
	
	@RequestMapping(value="/email", method=RequestMethod.GET)
	public String emialVidate(HttpServletRequest request){
		return "system/email";
	}
	
	@RequestMapping(value="/timeout", method=RequestMethod.GET)
	public String timeout(Model model){
		return "system/timeout";
	}
	
	/**
	 *用户信息完善页面 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/regdetail", method=RequestMethod.GET)
	public String reg_detail(Model model){
		return "user/reg_detail";
	}
	/**
	 * 注册成功待激活页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/activeuser", method=RequestMethod.GET)
	public String regemail(Model model){
		return "system/regemail";
	}
	
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/passbackemail", method=RequestMethod.GET)
	public String doPassBack(Model model){
		return "system/passback";
	}
	
}
