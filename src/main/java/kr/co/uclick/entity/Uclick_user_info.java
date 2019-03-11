package kr.co.uclick.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.TableGenerator;

@Entity
@TableGenerator(name = "Uclick_user_info")
public class Uclick_user_info {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "Uclick_user_info")
	@Column
	private Long id;
	
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getPhoneList() {
		return phoneList;
	}

	public void setPhoneList(int phoneList) {
		this.phoneList = phoneList;
	}

	@Column(length=20)
	private String name;
	
	@Column
	private int age;
	
	@Column
	private int phoneList;
}
