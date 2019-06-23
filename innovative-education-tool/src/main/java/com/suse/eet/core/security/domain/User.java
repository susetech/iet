package com.suse.eet.core.security.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user_account")
public class User {

	public User(User user) {
		this.active = user.active;
		this.firstName = user.getFirstName();
		this.middleName = user.getMiddleName();
		this.email = user.email;
		this.userName = user.getUserName();
		this.password = user.getPassword();
		this.roles = user.getRoles();
	}
	
	public User(){
		
	}
	
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "userId")
	private Integer userId;
	@Column(name = "tenantId")
	private Integer tenantId;
	@Column(name = "orgId")
	private Integer orgId;
	@Column(name = "userName")
	private String userName;
	@Column(name = "password")
	private String password;
	@Column(name = "firstName")
	private String firstName;
	@Column(name = "middleName")
	private String middleName;
	@Column(name = "lastName")
	private String lastName;
	@Column(name = "dob")
	private Date dob;
	@Column(name = "email")
	private String email;
	@Column(name = "contactNo")
	private String contactNo;
	@Column(name = "gender")
	private Integer gender;
	@Column(name = "active")
	private boolean active;
	@Column(name = "passwordExpired")
	private boolean passwordExpired = false;
	@Column(name = "passwordExpiryDate")
	private Date passwordExpiryDate;
	@Column(name = "activationCode")
	private String activationCode;
	@Column(name = "ConfirmationCode")
	private String ConfirmationCode;
	@Column(name = "expiryDate")
	private Date expiryDate;
	@Column(name = "passwordResetLinkSent")
	private Date passwordResetLinkSent;
	@Column(name = "lastLoginDate")
	private Date lastLoginDate;
	@Column(name = "lastLoginHostName")
	private String lastLoginHostName;
	@Column(name = "failedAttempts")
	private int failedAttempts;
	@Column(name = "userType")
	private Integer userType;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userId"), inverseJoinColumns = @JoinColumn(name="roleId"))
	private List<Role> roles;
	@Transient
	private Set<String> permissions;
	@Transient
	private Map<String, Object> attributes = new HashMap<String, Object>();

	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getTenantId() {
		return tenantId;
	}

	public void setTenantId(Integer tenantId) {
		this.tenantId = tenantId;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isPasswordExpired() {
		return passwordExpired;
	}

	public void setPasswordExpired(boolean passwordExpired) {
		this.passwordExpired = passwordExpired;
	}

	public Date getPasswordExpiryDate() {
		return passwordExpiryDate;
	}

	public void setPasswordExpiryDate(Date passwordExpiryDate) {
		this.passwordExpiryDate = passwordExpiryDate;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public String getConfirmationCode() {
		return ConfirmationCode;
	}

	public void setConfirmationCode(String confirmationCode) {
		ConfirmationCode = confirmationCode;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Date getPasswordResetLinkSent() {
		return passwordResetLinkSent;
	}

	public void setPasswordResetLinkSent(Date passwordResetLinkSent) {
		this.passwordResetLinkSent = passwordResetLinkSent;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getLastLoginHostName() {
		return lastLoginHostName;
	}

	public void setLastLoginHostName(String lastLoginHostName) {
		this.lastLoginHostName = lastLoginHostName;
	}

	public int getFailedAttempts() {
		return failedAttempts;
	}

	public void setFailedAttempts(int failedAttempts) {
		this.failedAttempts = failedAttempts;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Set<String> getPermissions() {
		return permissions;
	}

	public void setPermissions(Set<String> permissions) {
		this.permissions = permissions;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

}
