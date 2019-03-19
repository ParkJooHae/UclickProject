package kr.co.uclick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;
import kr.co.uclick.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
//	@Transactional(readOnly = true)
	public List<User> findUserByName(String name) {
		return userRepository.findUserByName(name);
	}

	@Override
//	@Transactional(readOnly = true)
	public List<User> findUserByNameContaining(String name) {
		return userRepository.findUserByNameContaining(name);
	}

	@Override
//	@Transactional(readOnly = true)
	public List<User> findAllByOrderByIdDesc() {

		return userRepository.findAllByOrderByIdDesc();
	}
	

	@Override
	public List<User> findAllById(Long id) {
		return userRepository.findAllById(id);
	}

	@Override
	public void Create(String name, String depart, String position, String address, String special) {
		User usr = new User();
		usr.setName(name);
		usr.setDepart(depart);
		usr.setPosition(position);
		usr.setAddress(address);
		usr.setSpecial(special);
		userRepository.save(usr);
	}
	
	@Override
	public void Update(Long id, String name, String depart, String position, String address, String special) {
		User usr = userRepository.getOne(id);
		usr.setName(name);
		usr.setDepart(depart);
		usr.setPosition(position);
		usr.setAddress(address);
		usr.setSpecial(special);
		userRepository.save(usr);
		
	}

	@Override
	public void Delete(Long id) {
		userRepository.deleteById(id);
	}


	

}
