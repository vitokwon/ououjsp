package notice.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.customer.NoticeDetailController;
import notice.controller.customer.NoticeController;
import notice.controller.customer.NoticeEditController;
import notice.controller.customer.NoticeEditProcController;
import notice.controller.customer.NoticeRegController;
import notice.controller.customer.NoticeRegProcController;

public class MyDispatcher extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hihi");
		String uri=request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
//		System.out.println("uri : "+uri);
//		System.out.println("conpath : "+conPath);
		System.out.println("com : "+com);
		
//		NoticeDetailController controller1=new NoticeDetailController();
//		NoticeEditController controller2=new NoticeEditController();
		NController ncontroller=null;
		
		
		try {
			if(com.equals("/customer/noticeDetail.do")){
//				controller1.execute(request,response);
				ncontroller=new NoticeDetailController();
			}else if(com.equals("/customer/noticeEdit.do")){
//				controller2.execute(request,response);
				ncontroller=new NoticeEditController();
			}else if(com.equals("/customer/noticeEditProc.do")) {
				ncontroller=new NoticeEditProcController();
			}else if(com.equals("/customer/noticeReg.do")) {
				ncontroller=new NoticeRegController();
			}else if(com.equals("/customer/noticeRegPro.do")) {
				ncontroller=new NoticeRegProcController();
			}else if(com.equals("/customer/notice.do")) {
				ncontroller=new NoticeController();
			}
			ncontroller.execute(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
