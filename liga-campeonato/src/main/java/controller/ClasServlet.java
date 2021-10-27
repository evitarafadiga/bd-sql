package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Classificacao;
import persistence.ClasDao;
import persistence.IClasDao;

@WebServlet("/classificacao")
public class ClasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClasDao cDao;
       
    public ClasServlet() {
    	try {
    		cDao = new ClasDao();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("button");
		String erro = "";
		
		Classificacao clas = validaCampos(request,cmd);
		
		List<Classificacao> listaClas = new ArrayList<Classificacao>();
		
		try {
			if (cmd.contains("Classificacao")) {
					System.out.println(listaClas);
					listaClas = cDao.clasGeral();
					//System.out.println(listaClas);

			}
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("listaClas", listaClas);
			RequestDispatcher rd = request.getRequestDispatcher("classificacao.jsp");
			rd.forward(request, response);
		}
	}
	
	private Classificacao validaCampos(HttpServletRequest request, String cmd) {
		Classificacao clas = new Classificacao();
		if (!cmd.contains("Classificacao")) {
			
		}
		System.out.println("Teste");
		return clas;
	}	
	
}
