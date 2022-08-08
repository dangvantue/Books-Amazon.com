package com.aptech.admin.author;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "Author not found")
public class AuthorNotFoundRestException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
