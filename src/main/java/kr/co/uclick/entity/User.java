package kr.co.uclick.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.TableGenerator;


@Entity
@TableGenerator(name = "user")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)// L2 Cache
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO,generator = "user")
	@Column(name="id", unique=true, nullable=false)
	private Long id;
	
	@Column(length=20)// 이름 길이 제한 20
	private String name;//이름
	
	@Column
	private String depart;//부서
	
	@Column
	private String position;//직급

	@Column
	@OneToMany(cascade=CascadeType.ALL,mappedBy="user",fetch=FetchType.EAGER)
	private Collection<Phone> phoneList;//전화부
	
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

	public Collection<Phone> getPhoneList() {
		if(phoneList == null) {
			phoneList = new ArrayList<Phone>();
		}
		return phoneList;
	}

	public void setPhoneList(Collection<Phone> phoneList) {
		this.phoneList = phoneList;
	}

	public void addPhone(Phone phone) {
		Collection<Phone> phoneList = getPhoneList();
		phone.setUser(this);
		phoneList.add(phone);
		
	}



	
}
