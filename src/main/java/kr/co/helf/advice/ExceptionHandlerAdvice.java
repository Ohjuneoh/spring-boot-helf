package kr.co.helf.advice;

import org.springframework.dao.DataAccessException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import kr.co.helf.exception.PersonalLessonException;
import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@Slf4j
public class ExceptionHandlerAdvice {

	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex) {
		log.error(ex.getMessage(), ex);
		return "error/unknown";
	}
	
	@ExceptionHandler(RuntimeException.class)
	public String handleRuntimeException(RuntimeException ex) {
		log.error(ex.getMessage(), ex);
		return "error/server";
	}

	@ExceptionHandler(DataAccessException.class)
	public String handleDataAccessException(DataAccessException ex) {
		log.error(ex.getMessage(), ex);
		return "error/db";
	}
	
	@ExceptionHandler(AccessDeniedException.class)
	public String handleAccessDeniedException(AccessDeniedException ex) {
		throw ex;
	}
	@ExceptionHandler(PersonalLessonException.class)
    public ModelAndView handlePersonalLessonException(PersonalLessonException ex) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("error/personalLesson");  // 에러 페이지 이름
        modelAndView.addObject("message", ex.getMessage());     // 에러 메시지 전달
        return modelAndView;
    }
}
