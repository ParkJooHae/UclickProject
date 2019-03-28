package kr.co.uclick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.dto.UserDto;
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
	public List<User> findUserByNameContaining(String name,int page, int cnt) {
		return userRepository.findUserByNameContaining(name, PageRequest.of(page, cnt)).getContent();
	}

	@Override
//	@Transactional(readOnly = true)
	public List<User> findAllByOrderByIdDesc(int page, int cnt) {
		return userRepository.findAllByOrderByIdDesc(PageRequest.of(page, cnt)).getContent();
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

	@Override
	public UserDto findPage(int page, int cnt, int searchOption, String keyword) {
		UserDto userDto = new UserDto();
		if(searchOption==0) {
			Page<User> user_list = userRepository.findAll(PageRequest.of(page, cnt));
			userDto.setLastPage(user_list.getTotalPages());//전체 데이터에 따른 페이지 수
			userDto.setTotalpage(user_list.getTotalElements());//전체 데이터 수
		}else if(searchOption==1) {
			
		}else if(searchOption==2) {
			
		}
		
		
		return userDto;
	}

	@Override
	public UserDto makePage(int page, int pagenum, int lastpage) {
		UserDto userDto = new UserDto();
		
		int blockstart =  ((page-1)/pagenum) * pagenum +1;
	 	int blockend = blockstart + pagenum - 1;
		if(blockend > lastpage) {
			blockend = lastpage;
		}
		int prevpage = blockstart - pagenum;
		int nextpage = blockstart + pagenum;
		if(prevpage < 1) {
			prevpage = 1;
		}
		if(nextpage > lastpage) {
			nextpage = lastpage;
		}
		if(nextpage < pagenum) {
			nextpage = lastpage;
		}
		
		userDto.setBlockstart(blockstart);
		userDto.setBlockend(blockend);
		userDto.setPrevpage(prevpage);
		userDto.setNextpage(nextpage);
		
		
		return userDto;
	}

	@Override
	public UserDto pagenow(String stringpage) {
		UserDto userDto = new UserDto();
		
		int page;
		if (stringpage == null) {//페이지 정보가 없을때 기본값
			stringpage = "1";
			page = Integer.parseInt(stringpage);
		} else {
			page = Integer.parseInt(stringpage);
		}	
		
		userDto.setPagenow(page);
		return userDto;
	}


	

}
