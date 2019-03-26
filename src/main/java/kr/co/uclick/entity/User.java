package kr.co.uclick.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.TableGenerator;
import org.hibernate.annotations.CacheConcurrencyStrategy;


@Entity 
@Cacheable
//@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)//L2 Cache적용
@TableGenerator(name = "usernum",allocationSize = 1)
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO,generator = "usernum")
	@Column(name="id", unique=true, nullable=false)
	private Long id;
	
	@Column(length=20)// 이름 길이 제한 20
	private String name;//이름
	
	@Column
	private String depart;//부서
	
	@Column
	private String position;//직급
	
	@Column
	private String address; // 주소

	@Column
	private String special; // 특이사항
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		if(special ==null) {
			special = "해당 없음";
		}
		this.special = special;
	}
	
	//@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.NONE)//Phone Collection에 대하여 Cache 적용
	@OneToMany(cascade=CascadeType.ALL,mappedBy="user")
	private Collection<Phone> phones;//전화부
	
	public User() {
		
	}
	
	public User(String string, String string2, String string3) {
		this.name = string;
		this.depart = string2;
		this.position = string3;
	}

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

	public Collection<Phone> getPhones() {
		if(phones == null) {
			phones = new ArrayList<Phone>();
		}
		return phones;
	}

	public void setPhones(Collection<Phone> phones) {
		this.phones = phones;
	}

	public void addPhone(Phone p) {
		Collection<Phone> phones = getPhones();
		p.setUser(this);
		phones.add(p);
		
	}



	
}
