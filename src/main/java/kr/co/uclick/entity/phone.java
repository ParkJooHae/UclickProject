package kr.co.uclick.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class phone {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private Long id;
	
	@Column
	private String phone_num;//전화번호
	
	@ManyToOne(optional=false)//null 허용 여부 false는 null 가능
	@JoinColumn(name="user_id")//user의 id를 key로
	private user user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public user getUser() {
		return user;
	}

	public void setUser(user user) {
		this.user = user;
	}


	
}
