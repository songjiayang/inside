package me.second.hand.entity;



/**
 * 商品种类列表
 */
public class Cateogry extends BaseEntity {
	
	private static final long serialVersionUID = 1531651344573657430L;
	
	private long id;
	
	private String name;
	
	private String description;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
