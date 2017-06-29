/**
 * haruki
 */
package com.haruki.lab.model;

/**
 * @author mid1672
 *
 */
public class Leaderboard {

	private String userName;
	private String gameTime;
	private Integer score;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGameTime() {
		return gameTime;
	}
	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer integer) {
		this.score = integer;
	}
}