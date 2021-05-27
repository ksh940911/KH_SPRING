package com.kh.spring.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.demo.model.service.DemoService;
import com.kh.spring.demo.model.validator.DevValidator;
import com.kh.spring.demo.model.vo.Dev;

/**
 * 사용자 요청 하나당 이를 처리하는 Controller 메소드(Handler)가 하나씩 존재한다.
 * 
 * 
 * <h1>handler메소드가 가질수 있는 매개변수</h1> 
 * <pre>
 * HttpServletRequest
 * HttpServletResponse
 * HttpSession
 * java.util.Locale : 요청에 대한 Locale
 * InputStream/Reader : 요청에 대한 입력스트림
 * OutputStream/Writer : 응답에 대한 출력스트림. ServletOutputStream, PrintWriter
 * 
 * @PathVariable: 요청url중 일부를 매개변수로 취할 수 있다.
 * @RequestParam
 * @RequestHeader
 * @CookieValue
 * @RequestBody
 * 
 * 뷰에 전달할 모델 데이터 설정
 * ModelAndView
 * Model
 * ModelMap 

 * @ModelAttribute : model속성에 대한 getter
 * @SessionAttribute : session속성에 대한 getter
 * SessionStatus: @SessionAttributes로 등록된 속성에 대하여 사용완료(complete)처리
 * 
 * Command객체 : http요청 파라미터를 커맨드객체에 저장한 VO객체
 * @Valid 커맨드객체 유효성 검사용
 * Error, BindingResult : Command객체에 저장결과, Command객체 바로 다음위치시킬것.
 * 
 * 기타
 * MultipartFile : 업로드파일 처리 인터페이스. CommonsMultipartFile
 * RedirectAttributes : DML처리후 요청주소 변경을 위한 redirect를 지원
 * 
 * ...
 * 
 * </pre>
 */
@Controller
@RequestMapping("/demo")
public class DemoController {
	
	
	
	/**
	 * spring용 logging클래스
	 */
	private static final Logger log = LoggerFactory.getLogger(DemoController.class);

	@Autowired
	private DemoService demoService;
	
	/**
	 * 사용자 요청을 처리하는 handler
	 * @return
	 */
	@RequestMapping("/devForm.do")
	public String devForm() {
		log.info("/demo/devForm.do 요청!");
		//viewResolver빈에 의해서 /WEB-INF/views + demo/devForm + .jsp jsp파일로 위임.
		return "demo/devForm";
	}
	
	@RequestMapping("/dev1.do")
	public String dev1(HttpServletRequest request, HttpServletResponse response) {
		//1. 사용자 입력값 처리
		String name = request.getParameter("name");
		int career = Integer.valueOf(request.getParameter("career"));
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String[] lang = request.getParameterValues("lang");
		
		Dev dev = new Dev(0, name, career, email, gender, lang);
		log.info("dev = {}", dev);
		
		//2. 업무로직
		
		//3. jsp에 출력
		request.setAttribute("dev", dev);
		
		return "demo/devResult";
	}
	
	
	/**
	 * name값과 일치하는 매개변수에 전달.
	 * 1. name값(userName)이 매개변수(name)와 일치하지 않는다면, name="userName" 지정  
	 * (name속성값이 매개변수명보다 우선순위 높음)
	 * 2. required="true"(기본값) 사용자가 선택적으로 입력하는 필드는 false로 명시할 것.
	 * 3. defaultValue를 지정한 경우, 값이 없거나, 형변환 오류가 발생해도 기본값으로 정상처리된다.
	 * 
	 * 
	 * @param name
	 * @param career
	 * @param email
	 * @param gender
	 * @param lang
	 * @param model
	 * @return
	 */
	@RequestMapping("/dev2.do")
	public String dev2(
			@RequestParam(name = "name") String name,
			@RequestParam(defaultValue = "1") int career,
			@RequestParam String email,
			@RequestParam String gender,
			@RequestParam(required = false) String[] lang,
			Model model
		) {
		Dev dev = new Dev(0, name, career, email, gender, lang);
		log.info("dev = {}", dev);
		
		//jsp에 위임
		model.addAttribute("dev", dev); // jsp에서 scope="request"에 저장되어 있음.
		
		return "demo/devResult";
	}
	
	
	/**
	 * 매개변수 Dev객체를  command커맨드객체라 한다.
	 * @ModelAttribute 모델에 등록된 속성을 가져오는 애노테이션.
	 * Dev객체는 handler도착전에 model에 등록되어 있다.
	 * 
	 * 커맨드객체 앞 @ModelAttribute 는 생략이 가능하다.
	 * 
	 * 
	 * @param dev
	 * @return
	 */
	@RequestMapping(value = "/dev3.do", method = {RequestMethod.POST})
	public String dev3(@ModelAttribute Dev dev) {
		log.info("dev = {}", dev);
		
		return "demo/devResult";
	}
	
	
	@RequestMapping(value = "/dev4.do", method = RequestMethod.POST)
	public String dev4(@Valid Dev dev, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			String errors = "";
			List<ObjectError> errorList = bindingResult.getAllErrors();
			for(ObjectError err : errorList) {
				errors += "{" + err.getCode() + ":" + err.getDefaultMessage() + "} ";
			}
			throw new IllegalArgumentException(errors);
		}
		
		return "demo/devResult";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new DevValidator());
	}
	
	/**
	 * RedirectAttributes
	 * 
	 * @param dev
	 * @param redirectAttr
	 * @return
	 */
	@RequestMapping(value = "/insertDev.do", method = RequestMethod.POST)
	public String insertDev(@ModelAttribute Dev dev, RedirectAttributes redirectAttr) {
		log.info("dev = {}", dev);
		
		try {
			//1. 업무로직
			int result = demoService.insertDev(dev);
			
			//2. 사용자 피드백 & 리다이렉트
			redirectAttr.addFlashAttribute("msg", "dev 등록 성공!");
		} catch(Exception  e) {
			log.error("dev 등록 오류!", e); // 에러 로그
			throw e;
		}
		
		return "redirect:/demo/devList.do";
	}
	
	@RequestMapping(value = "/devList.do", method = RequestMethod.GET)
	public String devvvvvvvvvvvvvvvvvList(Model model) {
		//1. 업무로직
		List<Dev> list = demoService.selectDevList();
		log.info("list = {}", list);
		log.info("1234567890");
		//2. jsp위임
		model.addAttribute("list", list);
		return "demo/devList";
	}
	
//	@RequestMapping(value = "/demo/updateDev.do", method = RequestMethod.GET)
	@GetMapping("/updateDev.do")
	public String updateDev(Model model, @RequestParam(name = "no", required = true) int no) {
		try {
			//1. 업무로직 
			Dev dev = demoService.selectOneDev(no);
			if(dev == null)
				throw new IllegalArgumentException("존재하지 않는 개발자 정보 : " + no);
			log.info("dev = {}", dev);
			//2. jsp 위임
			model.addAttribute("dev", dev);
		} catch(Exception e){
			log.error("Dev 수정페이지 오류!", e);
			throw e;
		}
		return "demo/devUpdateForm";
	}

//	@RequestMapping(value = "/demo/updateDev.do", method = RequestMethod.POST)
	@PostMapping("/updateDev.do")
	public String updateDev(@ModelAttribute Dev dev, RedirectAttributes redirectAttr) {
		log.info("수정요청 dev = {}", dev);
		try {
			//1. 업무로직
			int result = demoService.updateDev(dev);
			if(result == 0)
				throw new IllegalArgumentException("존재하지 않는 개발자 정보 : " + dev.getNo());
			
			//2. 사용자피드백 & 리다이렉트
			redirectAttr.addFlashAttribute("msg", "개발자 정보 수정 성공!");
		} catch(Exception e) {
			log.error("개발자 정보 수정 오류!", e);
			throw e;
		}
		return "redirect:/demo/devList.do";
	}
	
	@PostMapping("/deleteDev.do")
	public String deleteDev(@RequestParam int no, RedirectAttributes redirectAttr) {
		try {
			//1. 업무로직
			int result = demoService.deleteDev(no);
			//2. 사용자피드백 
			redirectAttr.addFlashAttribute("msg", "개발자 정보 삭제 성공!");
		} catch(Exception e) {
			log.error("개발자 정보 삭제 오류!", e);
			throw e;
		}
		return "redirect:/demo/devList.do";
	}
	
}




