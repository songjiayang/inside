package me.second.hand.service;

import java.util.List;
import me.second.hand.dao.GoodsDao;
import me.second.hand.entity.Goods;
import me.second.hand.util.MyTimeUtil;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsService {

	private Logger log = Logger.getLogger(GoodsService.class);

	@Autowired
	private GoodsDao goodsDao;

	public long makeNewGoods(Goods goods) {
		log.debug("调用GoodsService.makeNewGoods方法");
		return goodsDao.addOneGoods(goods);
	}

	public void modifyOneGoods(Goods goods) {
		log.debug("调用GoodsService.makeNewGoods方法");
		goodsDao.modifyOneGoods(goods);
	}

	public void deleteOneGoods(long id) {
		log.debug("调用GoodsService.deleteOneGoods方法");
		goodsDao.deleteOneGoods(id);
	}

	/**
	 * 列出被举报的商品
	 * 
	 * @return
	 */
	public List<Goods> listAllReportGoods(int i) {
		log.debug("调用GoodsService.listAllReportGoods方法");
		return goodsDao.filterQuery("select * from t_goods g where g.g_isreport = 1 order by g.g_releasetime limit "+ i*20+", 20");
	}

	
	public List<Goods> listAllReportGoods() {
		log.debug("调用GoodsService.listAllReportGoods方法");
		return goodsDao.filterQuery("select * from t_goods g where g.g_isreport = 1 ");
	}
	/**
	 * 查询一个用户的所有商品
	 * @param uid
	 * @return
	 */
	public List<Goods> listAllGoodsOfUser(long uid) {
		log.debug("调用GoodsService.listAllGoodsOfUser方法");
		String hql = "select * from t_goods g where g.g_userid =" + uid;
		return goodsDao.filterQuery(hql);
	}

	/**
	 * 按照不同类别查询
	 * @param id
	 * @return
	 */
	public List<Goods> listAllGoodsByCateogry(long id,int start,int number) {
		log.debug("调用GoodsService.listAllGoodsByCateogry方法");
		String hql = "select * from t_goods g  where g.g_category =" + id +" order by g.g_releasetime desc limit "+start+", "+number;
		return goodsDao.filterQuery(hql);
	}

	/**
	 * 按照时间的排序查询商品主要为了主页全部商品展现
	 * @param order
	 * @return
	 */
	public List<Goods> listAllGoodsByTime(String order,int start,int number) {
		log.debug("调用GoodsService.listAllGoodsByTime方法");
		String hql = "select * from t_goods g  order by g.g_releasetime "+ order+  " limit "+start+", " + number;	
		return goodsDao.filterQuery(hql);
	}
	
	/**
	 * 按照时间的排序查询商品主要为了主页全部商品展现
	 * @param order
	 * @return
	 */
	public List<Goods> listMoreGoodsByTime(String order,String time,int number,long cid) {
		log.debug("调用GoodsService.listAllGoodsByTime方法");
		String hql = "";
		if (cid==0) {
		   hql = "select * from t_goods g where g.g_releasetime <'"+time+"' order by g.g_releasetime "+ order+  " limit 0," + number;	
		}else {
			hql = "select * from t_goods g where g.g_categoryg="+cid+" and g.g_releasetime <'"+time+"' order by g.g_releasetime "+ order+  " limit 0," + number;
		}
		
		return goodsDao.filterQuery(hql);
	}

	public void cancelReported(long id) {
		log.debug("调用GoodsService.cancelReported方法");
		goodsDao.dmlByHql("update t_goods g  set g.g_isreport=0 where g.id="+id);
	}
	
	public void doReported(long id) {
		log.debug("调用GoodsService.cancelReported方法");
		goodsDao.dmlByHql("update t_goods g  set g.g_isreport=1 where g.id="+id);
	}

	public String  toUpPage(long id) {
		log.debug("调用GoodsService.cancelReported方法");
		Goods goods = goodsDao.findOneById(id);
		if (goods.getCondition()==0) {
			return "<"+goods.getTitle()+">"+"物品已下线，不能置顶";
		}else if(goods.getIsReport()==1) {
			return "<"+goods.getTitle()+">"+"物品被举报，不能置顶";
		}else if (MyTimeUtil.timeCanChanged(goods.getReleaseTime())) {
			goods.setReleaseTime(MyTimeUtil.getSystemTime());
			goodsDao.modifyOneGoods(goods);
			return "<"+goods.getTitle()+">"+"置顶成功，请到首页查看";
		}else {
			return "<"+goods.getTitle()+">"+"物品离上一次置顶时间不足1小时，不能置顶";
		}
		
	}
	
	public Goods findOneById(long id){
		log.debug("调用GoodsService.findOneById方法");
		return  goodsDao.findOneById(id);
	}
	
	public void  closeOne(long id){
		log.debug("调用GoodsService.closeOne方法");
		goodsDao.dmlByHql("update t_goods set g_condition =0 where id = " + id);
	}

}
