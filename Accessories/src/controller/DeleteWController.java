package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.WishlistItem;

/**
 * Servlet implementation class DeleteWController
 */
@WebServlet("/DeleteWController")
public class DeleteWController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<WishlistItem> items = (ArrayList<WishlistItem>) request.getSession().getAttribute("wishlist");
		int id = Integer.parseInt(request.getParameter("id"));
		for(WishlistItem item : items) {
			if(item.getId() == id) {
				items.remove(item);
				break;
			}
		}
		request.getSession().setAttribute("wishlist", items);
		response.sendRedirect("wishList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
