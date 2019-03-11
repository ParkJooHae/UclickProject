package kr.co.uclick.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)// L2 Cache
@TableGenerator(name = "user")
public class user {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "user")
	@Column
	private Long id;
	
	@Column(length=20)// 이름 길이 제한 20
	private String name;//이름
	
	@Column
	private String depart;//부서
	
	@Column
	private String position;//직급

	@Column
	@OneToMany(cascade=CascadeType.ALL,mappedBy="user")
	private List<phone> phoneList;//전화부
	
	
	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<phone> getPhoneList() {
		return phoneList;
	}

	public void setPhoneList(List<phone> phoneList) {
		this.phoneList = phoneList;
	}



	
}
