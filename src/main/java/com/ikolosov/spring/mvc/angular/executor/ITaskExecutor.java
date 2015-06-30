package com.ikolosov.spring.mvc.angular.executor;

import java.util.concurrent.Callable;

/**
 * @author ikolosov
 */
public interface ITaskExecutor {

	String process(String s) throws RuntimeException;

	class CustomTask implements Callable<String> {

		private final String customInput;

		public CustomTask(String customInput) {
			this.customInput = customInput;
		}

		@Override
		public String call() throws InterruptedException {
			/* 	[]
				this dummy sleep emulates some processing efforts;
				in real app whatever other business logic may be located here, for instance - database interaction
			*/
			Thread.sleep(1000);
			// [] marking out input as processed
			return "[PROCESSED] " + customInput;
		}
	}
}
