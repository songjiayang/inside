package me.second.hand.web;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import me.second.hand.cons.StaticInfo;
import me.second.hand.entity.Administor;
import me.second.hand.entity.EmailSession;
import me.second.hand.entity.Goods;
import me.second.hand.entity.User;
import me.second.hand.service.AdministorService;
import me.second.hand.service.GoodsService;
import me.second.hand.service.UserEmail;
import me.second.hand.service.UserService;
import me.second.hand.util.PassHider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	AdministorService aService;
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserEmail userEmail;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getlogin() {
		return "admin/login";
	}
	
	/**
	 * 用户提交登录信息，进行身份验证
	 * @param request
	 * @param loginForm
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView doValidate( HttpServletRequest request,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/login");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		Administor administor = aService.findOneByName(name);
		mv.setViewName("/admin/login");
		
		if (administor == null) {
			mv.addObject("errorMsg", "* 管理员账号输入错误!");
		} else if (!(administor.getPasswrod()).trim().equals(PassHider.doOneWayEncryption(pass.toString()))) {
			request.setAttribute("loginId", name);
			mv.addObject("errorMsg", "* 密码输入错误!");
		} else {
			session.setAttribute(StaticInfo.ADMIN_SESSION, administor);
			int count = goodsService.listAllReportGoods().size();
			if (count!=0) {
				count = count/20+1;
				request.setAttribute("id", 1);
			}else {
				request.setAttribute("id", 0);
			}
			session.setAttribute("count", count);
			request.setAttribute("goods", goodsService.listAllReportGoods(0));
			mv.setViewName("/admin/index");
		}
		return mv;
	}
	
	@RequestMapping(value = "/goods/{gid}", method = RequestMethod.GET)
	public String listReportGoods(HttpServletRequest request,@PathVariable int gid,HttpSession session){
		if (session.getAttribute(StaticInfo.ADMIN_SESSION)==null) {
			return "admin/login";
		}
		List<Goods> goods = new ArrayList<Goods>();
		if (gid<=0) {
			gid = 0;
		}
		if (gid>=Integer.parseInt(session.getAttribute("count").toString())) {
			gid = Integer.parseInt(session.getAttribute("count").toString())-1;
		}
		
		goods = goodsService.listAllReportGoods(gid);
		session.setAttribute("goods", goods);
		request.setAttribute("id", gid);
		return "admin/index";
		
	}
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String listReportGoods(HttpServletRequest request,HttpSession session){
		if (session.getAttribute(StaticInfo.ADMIN_SESSION)==null) {
			return "redirect:/index";
		}else {
			session.removeAttribute(StaticInfo.ADMIN_SESSION);
			return "redirect:/index";
		}
		
	}
	
	@RequestMapping(value = "/warning/{gid}", method = RequestMethod.GET)
	public String warningOne(HttpServletRequest request,@PathVariable long gid,HttpSession session){
		Goods g = goodsService.findOneById(gid);
		if (g==null) {
			return "admin/index";
		}
		User u = userService.getOneUserById(g.getUserId());
		if (session.getAttribute(StaticInfo.ADMIN_SESSION)==null) {
			return "redirect:/index";
		}
		
		EmailSession emailSession=new EmailSession();
		emailSession.setEmail(u.getEmail());
		emailSession.setUserName(u.getUserName());	
		
		userEmail.registerByEmail(emailSession,"warning.txt","商品警告通知");
		return "admin/index";		
	}
	
	@RequestMapping(value = "/delete/{gid}", method = RequestMethod.GET)
	public String deleteGoods(HttpServletRequest request,HttpSession session,@PathVariable long gid){
		if (session.getAttribute(StaticInfo.ADMIN_SESSION)==null) {
			return "redirect:/index";
		}else {
			goodsService.deleteOneGoods(gid);
			return "redirect:/admin/goods/0";
		}
	}
}
