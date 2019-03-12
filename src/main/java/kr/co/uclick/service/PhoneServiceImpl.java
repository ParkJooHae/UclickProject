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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void AddNum(Long id, String num) {
		User usr = userRepository.getOne(id);
		Collection<Phone> phone =  usr.getPhoneList(); // 번호 여러개 수정을 어떻게 할까 
		
	}

	@Override
	public void UpdateNum(Long id, String num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNum(Long id, String num) {
		// TODO Auto-generated method stub
		
	}
	
	

}
