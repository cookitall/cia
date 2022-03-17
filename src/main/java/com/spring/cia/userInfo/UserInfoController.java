package com.spring.cia.userInfo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.spring.cia.command.UserInfoVO;
import com.spring.cia.userInfo.sevice.IUserInfoService;
import com.spring.cia.util.MailService;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {

	@Autowired
	private IUserInfoService service;

	@Autowired
	private MailService mail;

	//로그인 요청
	@GetMapping("/login")
	public void userLogin() {
		System.out.println("userLogin 요청 GET");
	}
	//로그인 처리
	@PostMapping("/login")
	public String userLogin(String userId, String userPw, Model model) {
		System.out.println("userLogin POST");
		UserInfoVO vo = service.userLogin(userId, userPw);
		model.addAttribute("user", vo);
		return "redirect:/";
	}


	//회원가입 요청
	@GetMapping("/join")
	public void userJoin() {
		System.out.println("userJoin GET");
	}
	//아이디 중복 확인(비동기)
	@ResponseBody 
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		System.out.println("user id 중복 확인 요청");
		int result = service.userIdChk(userId);
		if(result == 1) {
			return "duplicated";
		} else {
			return "ok";
		}
	}
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("인증 이메일: " + email);
		return mail.joinMail(email);		
	}
	//회원가입처리
	@PostMapping("/join")
	public String userJoin(UserInfoVO vo, RedirectAttributes ra) {
		System.out.println("userJoin 요청 POST");
		service.userJoin(vo);
		ra.addFlashAttribute("msg", "join");
		return "redirect:/userInfo/login";
	}


	//정보수정
	@GetMapping("/modify")
	public void userModify(HttpSession session, Model model) {
		System.out.println("userModify 요청 GET");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		UserInfoVO vo = service.userInfoGet(userId);
		model.addAttribute("userModi", vo);

	}
	//비밀번호확인(비동기)
	@ResponseBody 
	@PostMapping("/pwCheck")
	public String pwChk(@RequestBody String userOldPw,HttpSession session) {
		System.out.println("user pw  확인 요청");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		String result = service.userPwChk(userId);
		if(result.equals(userOldPw)) {
			return "ok";
		} else {
			return "duplicated";
		}
	}
	//정보수정 처리
	@PostMapping("/modify")
	public String userModify(UserInfoVO vo) {
		System.out.println("userModify 요청 POST");
		service.userModify(vo);
		System.out.println(vo);
		return "redirect:/";
	}


	//회원 탈퇴
	@GetMapping("/delete")
	public String userDelete(HttpSession session, RedirectAttributes ra) {
		System.out.println("userDelete 요청");
		String userId = ((UserInfoVO)session.getAttribute("userLogin")).getUserId();
		service.userDelete(userId);
		ra.addFlashAttribute("msg", "delete");
		return "redirect:/userInfo/login";
	}	
}
