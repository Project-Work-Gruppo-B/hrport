package hrport.project.main.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.io.IOException;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/app/getImage")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ImageServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext sc = getServletContext();
		String filename = sc.getRealPath("/WEB-INF/static/" + request.getParameter("imgPath"));
		boolean isFile = new File(filename).isFile();
		
		if(!isFile){
			//request.getRequestDispatcher("/WEB-INF/static/errors/404.jsp").forward(request, response);
			filename = sc.getRealPath("/WEB-INF/static/errors/404.jpg");
		}

		// Get the MIME type of the image
		String mimeType = sc.getMimeType(filename);
		if (mimeType == null) {
			sc.log("Could not get MIME type of " + filename);
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}

		try {
			streamFile(mimeType, filename, request, response);
		} catch (FileNotFoundException fileNotFoundException) {
			sc.log("Impossibile trovare: " + filename);
		}

		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	private void streamFile(String mimeType, String filename, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// Set content type
		response.setContentType(mimeType);

		// Set content size
		File file = new File(filename);
		response.setContentLength((int) file.length());

		// Open the file and output streams
		FileInputStream in = new FileInputStream(file);
		OutputStream out = response.getOutputStream();

		// Copy the contents of the file to the output stream
		byte[] buf = new byte[1024];
		int count = 0;
		while ((count = in.read(buf)) >= 0) {
			out.write(buf, 0, count);
		}
		in.close();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
