package notice.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface NController {
//	인터페이스란 추상메소드 모임

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
