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
	
	@Column(length=20)
	private String name;
	
	@Column
	private int age;
	
	@Column
	private int phoneList;
}
