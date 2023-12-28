package com.example.boot05.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.boot05.dto.UserDto;

/*
 *   
 *   원래는 DB 에서 읽어와야 하지만 DB 에 저장된 sample 데이터가 아래와 같다고 가정하고 로그인후 테스트해야한다.
 *   
 *   - 계정 / 비밀번호 예시
 *   
 *   1. 일반 사용자(USER)      =>  kimgura  / 1234
 *   2. 직원(STAFF)    =>  batman   / 1234 
 * 	 3. 관리자(ADMIN)   =>  superman / 1234
 */

@Service //bean 으로 만들기 위해
public class CustomUserDetailsService implements UserDetailsService{
	
	//Spring Security 가 로그인 처리시 호출하는 메소드 
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username 에는 로그인폼에 입력한 userName 이 전달된다.
		
		// 실제 DB 에는 ROLE_XXX 형식으로 저장이 되어 있어야한다 
		String role="";
		if(username.equals("kimgura")) {
			role="ROLE_USER";
		}else if(username.equals("batman")) {
			role="ROLE_STAFF";
		}else if(username.equals("superman")){
			role="ROLE_ADMIN";
		}
		//비밀번호를 암호화 하기 위한 객체 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		//DB 에는 암호화 되어서 비밀번호가 저장되어 있으므로
		String encodedPwd=encoder.encode("1234");
		
		//1. DB 에서 username 정보를 얻어와서 
		UserDto dto=new UserDto();
		dto.setUserName(username);
		dto.setPassword(encodedPwd);
		dto.setEmail("aaa@");
		dto.setRole(role);
		
		//2. UserDetails 객체에 해당정보를 담아서 리턴해 주어야 한다
		//권한은 1개 이지만 List 에 담아서 
		List<GrantedAuthority> authList=new ArrayList<>();
		authList.add(new SimpleGrantedAuthority(dto.getRole()));
		
		//Spring Security 가 제공하는 User 클래스는 UserDetails 인터페이스를 구현한 클래스 이다. 
		UserDetails ud=new User(dto.getUserName(), dto.getPassword(), authList);
		
		return ud;
	}

}









