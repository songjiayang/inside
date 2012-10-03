package me.second.hand.web;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.second.hand.cons.StaticInfo;
import me.second.hand.entity.Cateogry;
import me.second.hand.entity.EmailSession;
import me.second.hand.entity.Goods;
import me.second.hand.entity.User;
import me.second.hand.service.CategoryService;
import me.second.hand.service.GoodsService;
import me.second.hand.service.UserEmail;
import me.second.hand.service.UserService;
import me.second.hand.util.EmailAndSession;
import me.second.hand.util.FormatValidater;
import me.second.hand.util.ImageCompact;
import me.second.hand.util.MyTimeUtil;
import me.second.hand.util.PassHider;
import me.second.hand.util.session.MySessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	GoodsService goodsService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	UserEmail userEmail;

	/**
	 * 用户请求登录页面
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getlogin(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String userName = CookieUtils.validateCookie(request);
		if (null != userName) {
			User user = userService.getUserByEmailOrName(userName);
			if (null == user) {
				return ("/user/login");
			} else {
				request.getSession()
						.setAttribute(StaticInfo.USER_SESSION, user);
				response.setHeader("refresh", "3;URL="+request.getContextPath()+"/index");
				return ("/system/redirect");
			}
		} else {
			return "user/login";
		}
	}
	
	/**
	 * 用户提交登录信息，进行身份验证
	 * 
	 * @param request
	 * @param loginForm
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView doValidate(HttpServletRequest request,
			HttpServletResponse response, LoginForm loginForm)
			throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		User user = userService.getUserByEmailOrName(loginForm
				.getUserNameOrEmail());
		// 增加了Cookie的验证
		if (loginForm.getRememberme() == 1) {
			// 用户没有通过邮箱验证
			if (user.getIsvalidate() == 0) {
				request.getSession()
				.setAttribute(StaticInfo.EMAIL_STR, user);
//				mv.addObject("errorMsg", "* 用户未通过验证，请到邮箱进行验证!");
				mv.setViewName("redirect:/activeuser");
			} else if (user.getIsvalidate() == 1) {
				// 用户通过邮箱验证
				String userName = CookieUtils.validateCookie(request);
				if (null == userName) {
					CookieUtils.saveCookie(loginForm.getUserNameOrEmail(),
							loginForm.getPassWord(), request, response);
					if (null != user) {
						request.getSession().setAttribute(
								StaticInfo.USER_SESSION, user);
						mv.setViewName("/market/index");
						return mv;
					}
				}
			}
		} else if (loginForm.getRememberme() == 0) {
			mv.setViewName("/user/login");
			if (user == null) {
				mv.addObject("errorMsg", "* 用户名或邮箱输入错误!");
			} else if (!PassHider.toKnowPass(user.getPassword().trim()).equals(
					loginForm.getPassWord())) {
				request.setAttribute("loginId", loginForm.getUserNameOrEmail()
						.trim());
				mv.addObject("errorMsg", "* 密码输入错误!");

			} else if (user.getIsvalidate() == 0) {
//				mv.addObject("errorMsg", "* 用户未通过验证，请到邮箱进行验证!");
				request.getSession()
				.setAttribute(StaticInfo.EMAIL_STR, user);
				mv.setViewName("redirect:/activeuser");
			} else {

				request.getSession()
						.setAttribute(StaticInfo.USER_SESSION, user);
				mv.setViewName("redirect:/index");
			}
		}
		return mv;
	}

	/**
	 * 用户请求登录成功后的主页面
	 * 
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String userName = CookieUtils.validateCookie(request);
		if (null != userName) {
			User user = userService.getUserByEmailOrName(userName);
			request.getSession().setAttribute(StaticInfo.USER_SESSION, user);
			return ("/market/index");
		} else {
			return "redirect:/index";
		}
	}

	/**
	 * 用户安全退出
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/doLogout")
	public String doValidate(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		session.removeAttribute(StaticInfo.USER_SESSION);
		CookieUtils.deleteCookie(request, response);
		return "redirect:/user/login";
	}

	/**
	 * 用户注册请求
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String getNewUser(Model model) {
		return "user/reg";
	}

	/**
	 * 用户提交注册信息
	 * 
	 * @param request
	 * @param regForm
	 * @return
	 */
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public ModelAndView makeNewUser(HttpServletRequest request, RegForm regForm) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/reg");
		if (!FormatValidater.isEmail(regForm.getEmail().trim())) {
			mav.addObject("errorMsg", "* 输入的邮箱格式不正确!");
			return mav;
		} else if (!FormatValidater.isUserName(regForm.getUsername().trim())) {
			request.setAttribute("email", regForm.getEmail().trim());
			mav.addObject("errorMsg", "* 用户名必须是长度为2-16的字母、_以及汉字的组合 ！");
			return mav;
		}
		User u = userService.getUserByEmailOrName(regForm.getEmail().trim());
		if (u != null) {
			mav.addObject("errorMsg", "* 该邮箱已经被注册，请跟换邮箱 *");
		} else if (userService.getUserByEmailOrName(regForm.getUsername()) != null) {
			request.setAttribute("email", regForm.getEmail().trim());
			mav.addObject("errorMsg", "* 该用户名太受欢迎了,已经被注册了!");
		} else {
			u = new User();
			u.setEmail(regForm.getEmail().trim());
			u.setPassword(PassHider.doOneWayEncryption(regForm.getPassword()
					.trim()));
			u.setUserName(regForm.getUsername().trim());
			u.setRegIp(request.getRemoteAddr());
			u.setIsvalidate(0);
			userService.addUser(u);
			//存储用户信息
			EmailSession emailSession = new EmailSession();
			emailSession.setEmail(u.getEmail());
			emailSession.setRegTime(request.getSession().getCreationTime());
			emailSession.setRegId(request.getSession().getId().toLowerCase());
			emailSession.setUserName(u.getUserName());
			MySessionContext.AddSession(emailSession);
			userEmail.registerByEmail(emailSession, "email.txt", "Inside注册认证");
			//存储Email对应到SessionID
			EmailAndSession.AddSession(u.getEmail(), request.getSession().getId().toLowerCase());
			request.getSession().setAttribute(StaticInfo.EMAIL_STR, u);
			mav.setViewName("redirect:/activeuser");
//			request.setAttribute("errorMsg", "请到您的注册邮箱进行身份验证！");
		}

		return mav;
	}

	/**
	 * 完善用户详细信息请求
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/reg_detail", method = RequestMethod.GET)
	public String getRegMore(HttpServletRequest request) {
		if (request.getSession().getAttribute(StaticInfo.USER_SESSION) == null) {
			return "redirect:/user/login";
		}
		return "user/reg_detail";
	}

	/**
	 * 提交用户详细信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doreg_detail", method = RequestMethod.POST)
	public String upRegMore(HttpServletRequest request,
			RegDetialForm regdetialform) {
		User user = (User) request.getSession().getAttribute(
				StaticInfo.USER_SESSION);
		if (user == null) {
			return "redirect:/user/login";
		}
		if (null != user && regdetialform != null) {
			user.setRealName(regdetialform.getRealName().trim());
			user.setIdNumber(regdetialform.getIdNum().trim());
			user.setSchool(regdetialform.getSchool());
			user.setSpecialty(regdetialform.getSpecialty());
			if (regdetialform.getGrade().trim().equals("年级")) {
				user.setGrade(2009);
			} else {
				user.setGrade(Integer.parseInt(regdetialform.getGrade().trim()));
			}
			user.setSex(regdetialform.getSex());
			user.setTel(regdetialform.getTel().trim());
			user.setRegTime(MyTimeUtil.getSystemTime());
			user.setQq(regdetialform.getQq().trim());
			try {
				userService.modifyOne(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/index";
	}

	/**
	 * 展现用户的所有商品
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String listGoods(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute(StaticInfo.USER_SESSION) == null) {
			return "redirect:/user/login";
		} else {
			User user = (User) session.getAttribute(StaticInfo.USER_SESSION);
			List<Goods> goods = goodsService.listAllGoodsOfUser(user.getId());
			request.setAttribute("goods", goods);
			return "user/goods";
		}
	}

	@RequestMapping(value = "/make_goods", method = RequestMethod.GET)
	public String toMakeAGoods(HttpServletRequest request) {
		if (request.getSession().getAttribute(StaticInfo.USER_SESSION) == null) {
			return "redirect:/user/login";
		}
		List<Cateogry> cateogries = categoryService.getAllCateogrys();
		request.setAttribute("categories", cateogries);
		return "user/make_goods";
	}

	@RequestMapping(value = "/make_goods", method = RequestMethod.POST)
	public String storeGoods(HttpSession session, HttpServletRequest request,
			@RequestParam("img") CommonsMultipartFile img,
			@RequestParam("title") String title,
			@RequestParam("price") float price,
			@RequestParam("category") long category,
			@RequestParam("newlevel") String newlevel,
			@RequestParam("content1") String introdution) {
		User user = (User) session.getAttribute(StaticInfo.USER_SESSION);
		if (null == user) {
			return "redirect:/user/login";
		}
		if (!img.isEmpty()) {
			String filename = new Date().getTime() + img.getOriginalFilename();
			String filepath = request.getSession().getServletContext()
					.getRealPath("/attached/" + filename);
			try {
				ImageCompact.createFileByBtye(img.getBytes(), filepath);
				// img.getFileItem().write(new File(filepath));
				Goods goods = new Goods();
				goods.setImgUrl(request.getContextPath() + "/attached/"
						+ filename);
				if (title.trim().length()>18) {
					goods.setTitle(title.trim().substring(0, 17));
				}else {
					goods.setTitle(title.trim());
				}
				goods.setPrice(price);
				goods.setCateogryId(category);
				goods.setCondition(1);
				goods.setNewLevel(newlevel.trim());
				goods.setIntroduction(introdution);
				goods.setUserId(user.getId());
				goodsService.makeNewGoods(goods);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "redirect:/user/goods";
	}

	@RequestMapping(value = "/remove/{gid}", method = RequestMethod.GET)
	public String removeOneGoods(@PathVariable long gid,
			HttpServletRequest request) {
		if (request.getSession().getAttribute(StaticInfo.USER_SESSION) == null) {
			return "redirect:/user/login";
		}
		goodsService.deleteOneGoods(gid);
		return "redirect:/user/goods";
	}

	@RequestMapping(value = "/report/{gid}", method = RequestMethod.GET)
	public String doReport(@PathVariable String gid, Model model) {
		return "redirect:/user/goods";
	}

	@RequestMapping(value = "/info/{uid}", method = RequestMethod.GET)
	public String findInfo(@PathVariable long uid, HttpServletRequest request) {
		User u = userService.getOneUserById(uid);
		request.setAttribute("userinfo", u);
		return "user/info";
	}

	@RequestMapping(value = "/u_info", method = RequestMethod.GET)
	public String upInfo(HttpServletRequest request) {
		if (request.getSession().getAttribute(StaticInfo.USER_SESSION) == null) {
			return "redirect:/user/login";
		}
		request.setAttribute("userinfo",
				request.getSession().getAttribute(StaticInfo.USER_SESSION));
		return "user/modify_info";
	}

	@RequestMapping(value = "/u_info", method = RequestMethod.POST)
	public String doUpInfo(HttpServletRequest request, Model model,
			UserUpdateForm updateForm) {
		if (request.getSession().getAttribute(StaticInfo.USER_SESSION) == null) {
			return "redirect:/user/login";
		}
		User u = (User) request.getSession().getAttribute(
				StaticInfo.USER_SESSION);
		u.setRealName(updateForm.getName().trim());
		u.setIdNumber(updateForm.getIdNum().trim());
		u.setTel(updateForm.getTel().trim());
		u.setQq(updateForm.getQq().trim());
		u.setSchool(updateForm.getSchool().trim());
		u.setSpecialty(updateForm.getSpecialty().trim());
		if (updateForm.getGrade().trim().equals("年级")) {
			u.setGrade(2009);
		} else {
			u.setGrade(Integer.parseInt(updateForm.getGrade().trim()));
		}
		u.setSex(updateForm.getSex().trim());
		userService.modifyOne(u);
		request.setAttribute("userinfo", u);
		return "user/info1";
	}

	@RequestMapping(value = "/pass_back", method = RequestMethod.GET)
	public String passBack() {
		return "user/pass_back";
	}

	@RequestMapping(value = "/pass_back", method = RequestMethod.POST)
	public String dopassBack(@RequestParam("email") String email,
			HttpServletRequest request) {
		if (!FormatValidater.isEmail(email.trim())) {
			request.setAttribute("error1", "* 请输入正确的邮箱 !");
			return "user/pass_back";
		} else {
			EmailSession emailSession = new EmailSession();
			// emailSession.setUserName(email);
			emailSession.setEmail(email);
			emailSession.setUserName("用户");
			emailSession.setRegId(request.getSession().getId().toLowerCase());
			emailSession.setRegTime(request.getSession().getCreationTime());
			MySessionContext.AddSession(emailSession);
			userEmail.registerByEmail(emailSession, "emailpassword.txt",
					"用户密码找回");
//			request.setAttribute("errorMsg", "新密码设置 邮件已发送至邮箱，请查收！");
			User user=new User();
			EmailAndSession.AddSession(email, emailSession.getRegId());
			user.setEmail(email);
			request.getSession().setAttribute(StaticInfo.EMAIL_STR, user);
			
			return "redirect:/passbackemail";
		}

	}

	@RequestMapping(value = "/doPass_back", method = RequestMethod.POST)
	public String doPassBack(HttpServletRequest request) {
		return "";
	}

	@RequestMapping(value = "/pass_change", method = RequestMethod.GET)
	public String passChange(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute(
				StaticInfo.USER_SESSION);
		if (u == null) {
			return "redirect:/user/login";
		}
		return "/user/change_pass";
	}

	/**
	 * 邮箱验证
	 * @param request
	 * @param rid
	 * @return
	 */
	@RequestMapping(value = "/reg/{rid}", method = RequestMethod.GET)
	public String doReg(HttpServletRequest request, @PathVariable String rid) {
		// in here do somethings
		
		EmailSession emailSession = MySessionContext.getSession(rid);
		if (emailSession!=null) {
			// httpSession.getAttribute(StaticInfo.USER_SESSION);
			//判断是否过期
			if (MyTimeUtil.timeCanChanged(emailSession.getRegTime(),
					StaticInfo.ONE_HOUR *24)) {
				MySessionContext.DelSession(emailSession);
				emailSession.setRegTime(System.currentTimeMillis());
				MySessionContext.AddSession(emailSession);
				userEmail.registerByEmail(emailSession, "email.txt",
						"Inside注册认证");				
//				EmailAndSession.AddSession(emailSession.getEmail(),rid);
				User u=new User();
				u.setEmail(emailSession.getEmail());
				request.getSession().setAttribute(StaticInfo.EMAIL_STR, u);
				return "redirect:/timeout";
			} else {
				userService.idValidated(emailSession.getEmail());
				MySessionContext.DelSession(emailSession);
				EmailAndSession.DelSession(emailSession.getEmail());
				// request.setAttribute("errorMsg", "邮箱验证成功！请登录。");
				User user = userService.getUserByEmailOrName(emailSession.getEmail());
				request.getSession()
						.setAttribute(StaticInfo.USER_SESSION, user);
				return "redirect:/regdetail";
			}

		} else {
			return "redirect:/error/404";
		}
		// return null;
	}

	@RequestMapping(value = "/passwordback/{rid}", method = RequestMethod.GET)
	public String doPassword(HttpServletRequest request,
			@PathVariable String rid) {
		// in here do somethings
		EmailSession httpSession = MySessionContext.getSession(rid);
		if (null != httpSession) {
			// httpSession.getAttribute(StaticInfo.USER_SESSION);
			if (MyTimeUtil.timeCanChanged(httpSession.getRegTime(),
					StaticInfo.ONE_HOUR * 24)) {
				MySessionContext.DelSession(httpSession);
				return "redirect:/error/404";
			} else {
				// userService.idValidated(httpSession.getEmail());;
				// MySessionContext.DelSession(httpSession);
				request.getSession().setAttribute("EmailSession", httpSession);
				return "user/new_pass";
			}

		} else {
			return "redirect:/error/404";
		}
		// return null;
	}

	@RequestMapping(value = "/pass_change", method = RequestMethod.POST)
	public String doPassChange(HttpServletRequest request,
			@RequestParam("oldpass") String oldpass,
			@RequestParam("newpass1") String newpass1,
			@RequestParam("newpass2") String newpass2) {
		User u = (User) request.getSession().getAttribute(
				StaticInfo.USER_SESSION);
		if (u == null) {
			return "redirect:/user/login";
		}
		if (!PassHider.doOneWayEncryption(oldpass.trim()).equals(u.getPassword().trim())) {
			request.setAttribute("error1", "* 原密码输入错误 !");
			return "/user/change_pass";
		} else if (!newpass1.trim().equals(newpass2.trim())) {
			request.setAttribute("error3", "* 两次密码输入不匹配 !");
			request.setAttribute("oldpass", oldpass);
			return "/user/change_pass";
		} else if (!FormatValidater.isUserName(newpass1)) {
			request.setAttribute("error2", "* 新密码格式不符合要求 !");
			request.setAttribute("oldpass", oldpass);
			return "/user/change_pass";
		}
		u.setPassword(PassHider.doOneWayEncryption(newpass2));
		userService.modifyOne(u);
		request.getSession().removeAttribute(StaticInfo.USER_SESSION);
		return "redirect:/user/login";
	}

	@RequestMapping(value = "/pass_new", method = RequestMethod.POST)
	public String doPassNewChange(HttpServletRequest request,
			@RequestParam("newpass1") String newpass1,
			@RequestParam("newpass2")	 String newpass2) {
		EmailSession emailSession = (EmailSession) request.getSession()
				.getAttribute("EmailSession");
		if (emailSession == null) {
			return "redirect:/user/login";
		}
		if (!newpass1.trim().equals(newpass2.trim())) {
			request.setAttribute("error3", "* 两次密码输入不匹配 !");
			return "user/pass_back";
		} else {
			userService.updatePass(emailSession.getEmail(),
					PassHider.doOneWayEncryption(newpass1));
			request.setAttribute("errorMsg", "新密码设置成功！请重新登陆");
			return "user/login";
		}

	}
	
	/**
	 * 重发邮件
	 * @param request
	 * @param rid
	 * @return
	 */
	@RequestMapping(value = "/activeuser/resend", method = RequestMethod.POST)
	public String onceAgain(HttpServletRequest request,@RequestParam("email") String emailString) {
		
		OnceAgainEmail onceAgainEmail=new OnceAgainEmail();
		onceAgainEmail.sendEmail(userEmail, emailString);
		return "redirect:/activeuser";		

	}
	
	
	/**
	 * 重发密码邮件
	 * @param request
	 * @param rid
	 * @return
	 */
	@RequestMapping(value = "/activeuser/resendpassword", method = RequestMethod.POST)
	public String onceAgainPassword(HttpServletRequest request,@RequestParam("email") String emailString) {
		
		OnceAgainEmail onceAgainEmail=new OnceAgainEmail();
		onceAgainEmail.sendPassEmail(userEmail, emailString);
		return "redirect:/passbackemail";		

	}
	
}
