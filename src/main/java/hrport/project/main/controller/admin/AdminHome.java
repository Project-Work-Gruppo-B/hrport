package hrport.project.main.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.service.CandidaturaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/admin/home")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String candidatiJson = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();

		try {
			List<Candidatura> candidati = CandidaturaService.getCandidateList();
			candidatiJson = gson.toJson(candidati);

		} catch (Exception e) {
			String error = e.getMessage();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.setAttribute("data", error);
			request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			return;
		}

		request.setAttribute("candidati", candidatiJson);
		response.sendRedirect(request.getContextPath() + "/admin/candidati");
		return;

	}
}
