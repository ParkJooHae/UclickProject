package kr.co.uclick.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;
import kr.co.uclick.repository.PhoneRepository;
import kr.co.uclick.repository.UserRepository;

public class PhoneServiceImpl implements PhoneService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PhoneRepository phoneRepository;
	
	@Override
	public List<Phone> findByNumContaining(String number) {
		return phoneRepository.findByNumContaining(number);
	}

	@Override
	public void AddNum(Long id, String num) {
		User usr = userRepository.findById(id).get();
		Phone phone = new Phone(num);
		phone.setUser(usr);
		phoneRepository.save(phone);
	}

	@Override
	public void UpdateNum(Long id, String num) {
		Phone phone = phoneRepository.findById(id).get();
		phone.setNum(num);
		phoneRepository.save(phone);
	}

	@Override
	public void deleteNum(Long id, String num) {		
		Phone phone = phoneRepository.findById(id).get();
		phoneRepository.delete(phone);
		
	}
	
	

}
