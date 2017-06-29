package com.haruki.lab.db.exception;

public class DbAccessError extends RuntimeException {

	
	 public DbAccessError() {
	        super();
	    }
	    public DbAccessError(String message) {
	        super(message);
	    }

	    public DbAccessError(String message, Throwable cause) {
	        super(message, cause);
	    }
 
	    public DbAccessError(Throwable cause) {
	        super(cause);
	    }

	   
	    protected DbAccessError(String message, Throwable cause,
	                               boolean enableSuppression,
	                               boolean writableStackTrace) {
	        super(message, cause, enableSuppression, writableStackTrace);
	    }
}
