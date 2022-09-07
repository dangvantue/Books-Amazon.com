package com.aptech.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class MainController {
	@GetMapping("")
	public String viewHomePage(HttpServletRequest request ) {
		Locale currentLocate = request.getLocale();
		String countryCode = currentLocate.getCountry();
		String countryName = currentLocate.getDisplayCountry();
		
		String langCode = currentLocate.getLanguage();
		String langName = currentLocate.getDisplayLanguage();
		
		System.out.println(countryCode + ": " + countryName);
		System.out.println(langCode + ": " + langName);
		
		System.out.println("==========================");
		String[] languages = Locale.getISOLanguages();
		
		for (String language : languages) {
			Locale locate = new Locale(language);
			System.out.println(language + ": " + locate.getDisplayLanguage());
		}
		
		return "index";
	}

	@GetMapping("/login")
	public String viewLoginPage() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			return "login";
		}

		return "redirect:/";
	}
}
