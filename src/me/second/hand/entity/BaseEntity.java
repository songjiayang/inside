package me.second.hand.entity;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 *所有entity的父类
 *实现了序列化和重写了toString方法
 */
public class BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 8843815283229261089L;

	public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
