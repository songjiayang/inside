package me.second.hand.dao;

import java.util.List;
import me.second.hand.entity.Goods;

public interface GoodsDao  {

	public long addOneGoods(Goods goods);

	public int modifyOneGoods(Goods goods);

	public int deleteOneGoods(long id);

	public Goods findOneById(long id);

	public List<Goods> filterQuery(String hql);
	
	public int dmlByHql(String hql);
	
	public int deleteList(List<Integer> ids);

}
