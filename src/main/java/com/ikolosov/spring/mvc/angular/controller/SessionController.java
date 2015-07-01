package com.ikolosov.spring.mvc.angular.controller;

import com.ikolosov.spring.mvc.angular.executor.ITaskExecutor;
import com.ikolosov.spring.mvc.angular.model.SessionInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author ikolosov
 */
@SessionAttributes("customInput")
@Controller
public class SessionController {

	private static final Logger logger = Logger.getLogger(SessionController.class.getName());

	@Autowired
	private ITaskExecutor taskExecutor;

	@RequestMapping(
			value = "/getSessionInfo",
			method = RequestMethod.GET,
			produces = "application/json"
	)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public SessionInfo getSessionInfo(HttpSession session) {
		SessionInfo sessionInfo = new SessionInfo();
		sessionInfo.setSessionId(session.getId());
		sessionInfo.setCreationTime(new Date(session.getCreationTime()).toString());
		logger.log(Level.INFO, "session info sent: " + sessionInfo.toString());
		return sessionInfo;
	}

	@RequestMapping(
			value = "/postInput",
			method = RequestMethod.POST
	)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public ModelAndView storeInputInSession(@RequestParam String customInput) {
		ModelAndView mav = new ModelAndView();
		String processed = taskExecutor.process(customInput);
		mav.addObject("customInput", processed);
		mav.setViewName("../../index");
		logger.log(Level.INFO, "processed input: " + processed);
		return mav;
	}

	@ExceptionHandler(value = Exception.class)
	public ModelAndView handleException(HttpServletRequest req, Exception e) {
		logger.log(Level.SEVERE, e.getMessage(), e);
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", req.getRequestURL());
		mav.addObject("exception", e);
		mav.setViewName("error");
		return mav;
	}
}
