package com.suse.eet.core.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	@Column(name = "roleId")
	private Integer roleId;
	@Column(name = "orgId")
	private Integer orgId;
	@Column(name = "name")
	private String name;
	@Column(name = "description")
	private String description;
	@Column(name = "custom")
	private boolean custom = true;
	

	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getOrgId() {
		return orgId;
	}
	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
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
	public boolean isCustom() {
		return custom;
	}
	public void setCustom(boolean custom) {
		this.custom = custom;
	}
	
	

}
