package kr.co.uclick.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.repository.PhoneRepository;

@Service
@Transactional
public class PhoneService {
	
	@Autowired
	private PhoneRepository phoneRepository;

}
