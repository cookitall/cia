package com.spring.cia.ceoInfo;

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

import com.spring.cia.ceoInfo.service.ICeoInfoService;
import com.spring.cia.command.CeoInfoVO;
import com.spring.cia.command.ShopVO;
import com.spring.cia.util.MailService;



@Controller
@RequestMapping("/ceoInfo")
public class CeoInfoController {

	@Autowired
	private ICeoInfoService service;
	@Autowired
	private MailService mail;
	
	//로그인 이동 요청
	@GetMapping("ceoLogin") 
	public void ceoLogin () {
		System.out.println("ceoLogin 요청 GET");
	}
	//로그인 처리
	@PostMapping("ceoLogin")
	public String ceoLogin(String ceoId, String ceoPw, Model model) {
		System.out.println("ceoLogin 요청 POST");
		CeoInfoVO vo = service.ceoLogin(ceoId, ceoPw);
		model.addAttribute("ceo", vo);
		return "redirect:/";
	}
	
	
	//회원가입 요청
	@GetMapping("/ceoJoin")
	public void ceoJoin() {
		System.out.println("ceoJoin 요청 GET");
	}
	//아이디 중복 확인(비동기)
	@ResponseBody 
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String ceoId) {
		System.out.println("ceo id 중복 확인 요청");
		int result = service.ceoIdChk(ceoId);
		if(result == 1) {
			return "duplicated";
		} else {
			return "ok";
		}
	}
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String ceoEmail) {
		String email = ceoEmail;
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("인증 이메일: " + email);
		return mail.joinMail(email);		
	}
	//회원가입처리
	@PostMapping("/ceoJoin")
	public String ceoJoin(CeoInfoVO vo, RedirectAttributes ra) {
		System.out.println("ceoJoin 요청 POST");
		service.ceoJoin(vo);
		ra.addFlashAttribute("msg", "welcome CIA's CEO");
		return "redirect:/ceoInfo/ceoLogin";
	}
	
	
	//정보수정
	@GetMapping("/ceoModify")
	public void ceoModify(HttpSession session, Model model) {
		System.out.println("ceoModify 요청 GET");
		String ceoId = ((CeoInfoVO)session.getAttribute("ceoLogin")).getCeoId();
		service.ceoInfoGet(ceoId);

	}
	//정보수정 처리
	@PostMapping("/ceoModify")
	public String ceoModify(CeoInfoVO vo) {
		System.out.println("ceoModify 요청 POST");
		service.ceoModify(vo);
		return "redirect:/";
	}
}
