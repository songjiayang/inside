package me.second.hand.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import me.second.hand.cons.StaticInfo;
import me.second.hand.entity.Cateogry;
import me.second.hand.entity.Goods;
import me.second.hand.entity.User;
import me.second.hand.service.CategoryService;
import me.second.hand.service.GoodsService;
import me.second.hand.service.UserService;
import me.second.hand.util.MyTimeUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 关于Goods的操作类
 * 
 * @author sjy
 */

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;

	@Autowired
	private CategoryService caService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String listAllGoods(HttpServletRequest request, HttpSession session) {
		if (request.getSession().getAttribute(StaticInfo.CATEGORY_SESSION) == null) {
			List<Cateogry> cateogries = caService.getAllCateogrys();
			request.getSession().setAttribute(StaticInfo.CATEGORY_SESSION, cateogries);
		}
		List<Goods> goods = goodsService.listAllGoodsByTime(StaticInfo.DESC, 0, 20);
		if (goods != null && goods.size() > 0) {
			session.setAttribute(StaticInfo.TIME_LIMIT, goods.get(goods.size() - 1).getReleaseTime());
			session.setAttribute(StaticInfo.CATEGORY_ID, 0);
		} else {
			session.setAttribute(StaticInfo.TIME_LIMIT, MyTimeUtil.getSystemTime());
			session.setAttribute(StaticInfo.CATEGORY_ID, 0);
		}
		request.setAttribute("goods", goods);
		return "market/index";
	}

	@RequestMapping(value = "/category/{cid}", method = RequestMethod.GET)
	public String listGoodsByCategory(@PathVariable long cid, HttpServletRequest request, HttpSession session) {
		if (request.getSession().getAttribute(StaticInfo.CATEGORY_SESSION) == null) {
			List<Cateogry> cateogries = caService.getAllCateogrys();
			request.getSession().setAttribute(StaticInfo.CATEGORY_SESSION, cateogries);
		}
		session.setAttribute(StaticInfo.CATEGORY_ID, cid);
		List<Goods> goods = null;
		if (cid == 0) {
			goods = goodsService.listAllGoodsByTime(StaticInfo.DESC, 0, 20);
		} else {
			goods = goodsService.listAllGoodsByCateogry(cid, 0, 20);
		}
		if (goods != null&&goods.size()>0) {
			session.setAttribute(StaticInfo.TIME_LIMIT, goods.get(goods.size() - 1).getReleaseTime());
		} else {
			session.setAttribute(StaticInfo.TIME_LIMIT, MyTimeUtil.getSystemTime());
		}
		request.setAttribute("goods", goods);
		return "market/index";
	}

	@RequestMapping(value = "/goods/{gid}", method = RequestMethod.GET)
	public String goodsDetail(@PathVariable long gid, HttpServletRequest request) {
		Goods g = goodsService.findOneById(gid);
		if (g == null) {
			return "market/index";
		} else {
			if (g.getTitle().length() > 30) {
				StringBuffer sb = new StringBuffer(g.getTitle().substring(0, 29));
				sb.append("....");
				g.setTitle(sb.toString());
			}
			request.setAttribute("goodsowner", userService.getOneUserById(g.getUserId()));
			request.setAttribute("goods", g);
			return "market/detail";
		}
	}

	@RequestMapping(value = "/goods/report/{gid}", method = RequestMethod.GET)
	public String doReport(@PathVariable long gid) {
		goodsService.doReported(gid);
		return "redirect:/index";
	}

	@RequestMapping(value = "/goods/close/{gid}", method = RequestMethod.GET)
	public String doClosed(@PathVariable long gid, HttpSession session) {
		if (session.getAttribute(StaticInfo.USER_SESSION) == null)
			return "redirect:/user/login";
		goodsService.closeOne(gid);
		return "redirect:/user/goods";
	}

	@RequestMapping(value = "/goods/before/{gid}", method = RequestMethod.GET)
	public String doBefore(@PathVariable long gid, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute(StaticInfo.USER_SESSION) == null)
			return "redirect:/user/login";
		request.setAttribute("error", goodsService.toUpPage(gid));
		User user = (User) session.getAttribute(StaticInfo.USER_SESSION);
		List<Goods> goods = goodsService.listAllGoodsOfUser(user.getId());
		request.setAttribute("goods", goods);
		return "user/goods";
	}

	@RequestMapping(value = "/goods/delete/{gid}", method = RequestMethod.GET)
	public String doDelete(@PathVariable long gid, HttpSession session) {
		if (session.getAttribute(StaticInfo.USER_SESSION) == null)
			return "redirect:/user/login";
		goodsService.deleteOneGoods(gid);
		return "redirect:/user/goods";
	}

	@RequestMapping(value = "/goods_wall", method = RequestMethod.GET)
	public String goodsWall(HttpServletRequest request) {
		List<Goods> goods = goodsService.listAllGoodsByTime(StaticInfo.DESC, 0, 40);
		request.setAttribute("goods", goods);
		return "market/goods_wall";
	}

	@RequestMapping(value = "/more", method = RequestMethod.GET)
	public void goodsMore(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html;charset=utf-8"); 
		request.setCharacterEncoding("UTF-8");
		PrintWriter printWriter=response.getWriter();
		String time = session.getAttribute(StaticInfo.TIME_LIMIT).toString();
		long cid = 0;
		if (session.getAttribute(StaticInfo.CATEGORY_ID) != null) {
			cid = Long.parseLong(session.getAttribute(StaticInfo.CATEGORY_ID).toString());
		}
		List<Goods> goods = goodsService.listMoreGoodsByTime(StaticInfo.DESC, time, 8, cid);
		String result = "";
		String content = request.getContextPath();
		if (goods != null && goods.size() > 0) {
			int i = 0;
			for (Goods goods2 : goods) {
				if (i == 6)
					i = 0;
				i++;
				result += "<li class='all' style='background:url(" + content + "/static/images/secondary_market/li_bg/" + i + ".png)'>";
				result += "<a href='" + content + "/goods/" + goods2.getId() + "'>";
				result += "<div class='image'>";
				result += "<img src='" + goods2.getImgUrl() + "' alt='poster1' />";
				result += "</div>";
				result += "<div class='small'>";
				result += goods2.getTitle();
				result += "</div>";
				result += "<div class='small'>";
				result += goods2.getPrice();
				result += "</div> </a>";
				result += "</li>";
			}
		}
		if (goods.size()>0) {
			session.setAttribute(StaticInfo.TIME_LIMIT, goods.get(goods.size()-1).getReleaseTime());
		}
		printWriter.print(result);
		printWriter.close();
		
	}
}
