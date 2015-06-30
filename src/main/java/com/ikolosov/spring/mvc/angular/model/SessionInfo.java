package com.ikolosov.spring.mvc.angular.model;

/**
 * @author ikolosov
 */
public class SessionInfo {

	private String sessionId;
	private String creationTime;

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}
}
