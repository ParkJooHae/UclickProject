package kr.co.uclick.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TableGenerator;

@Entity
@TableGenerator(name = "phone")// ,allocationSize = 1 hibernate_sequences를 1씩 으르도록
public class Phone {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "phone")//generator로 두 테이블의 id가 겹치지 않도록 해준다.
	@Column(name="id", unique=true, nullable=false)
	private Long id;
	
	@Column
	private String num;//전화번호
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")//user의 id를 key로
	private User user;
	
	public Phone() {
	
	}
	
	public Phone(String string) {
		this.num = string;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhone_num() {
		return num;
	}

	public void setPhone_num(String phone_num) {
		this.num = phone_num;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	
}
