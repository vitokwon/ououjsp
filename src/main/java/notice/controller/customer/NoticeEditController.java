package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditController implements NController {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeEditController nvc2 신호");

		String num = request.getParameter("c");
		if (num == null)
			num = "1";

		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(num);

		request.setAttribute("n", n);

		request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);

	}

}