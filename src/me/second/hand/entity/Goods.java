package me.second.hand.entity;
public class Goods extends BaseEntity{

	private static final long serialVersionUID = -4045807026817520351L;
	
	
	private long id;
	private String imgUrl;
	private String title;
	private long  cateogryId;
	private String introduction;
	private double price;
	private String releaseTime;
	private  long  userId;
	private int tradeType;
	private int condition;
	private int isReport;
	private String newLevel;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}

	public int getTradeType() {
		return tradeType;
	}
	public void setTradeType(int tradeType) {
		this.tradeType = tradeType;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public int getIsReport() {
		return isReport;
	}
	public void setIsReport(int isReport) {
		this.isReport = isReport;
	}
	public String getNewLevel() {
		return newLevel;
	}
	public void setNewLevel(String newLevel) {
		this.newLevel = newLevel;
	}
	public long getCateogryId() {
		return cateogryId;
	}
	public void setCateogryId(long cateogryId) {
		this.cateogryId = cateogryId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	
	

}
