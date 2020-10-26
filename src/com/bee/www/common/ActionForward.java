package com.bee.www.common;

//페이지 이동을 처리하기 위한 클래스
public class ActionForward {
	private String path;	//이동할 페이지 경로값을 갖는 변수
	private boolean redirect;	//sendRedirect와 forward 중 어떤 것을 이용해서 페이지 이동할지를 결정하기 위한 boolean 변수

	public ActionForward() {

	}
	public ActionForward(String path,boolean redirect) {
		this.path=path;
		this.redirect=redirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
}
