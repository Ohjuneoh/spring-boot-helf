package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/membership")
public class MembershipController {

	@GetMapping(value="list")
	public String list() {
		return "membership/list";
	}
}
