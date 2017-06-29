/**
 * haruki
 */
package com.haruki.lab.web;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * @author mid1672
 *
 */
public class UserSessionListener implements HttpSessionListener {

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionListener#sessionCreated(javax.servlet.http.HttpSessionEvent)
	 */
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("sessionCreated");
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionListener#sessionDestroyed(javax.servlet.http.HttpSessionEvent)
	 */
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("sessionDestroyed");
	}

}
