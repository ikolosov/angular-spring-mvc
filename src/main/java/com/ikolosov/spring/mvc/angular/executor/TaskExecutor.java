package com.ikolosov.spring.mvc.angular.executor;

import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author ikolosov
 */
@Component
public class TaskExecutor implements ITaskExecutor {

	private static final Logger logger = Logger.getLogger(TaskExecutor.class.getName());

	private final ExecutorService service = Executors.newSingleThreadExecutor();

	@Override
	public String process(String s) throws RuntimeException {
		try {
			return service.submit(new CustomTask(s)).get();
		} catch (ExecutionException | InterruptedException e) {
			throw new RuntimeException("task execution failed", e);
		}
	}

	@PreDestroy
	private void serviceShutDown() {
		logger.log(Level.INFO, "shutting down executor service...");
		service.shutdown();
	}
}
