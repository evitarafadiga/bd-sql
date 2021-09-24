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

import model.Grupo;
import persistence.GrupoDao;
import persistence.IGrupoDao;

@WebServlet("/grupo")
public class GrupoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IGrupoDao gDao;
       
    public GrupoServlet() {
    	try {
    		gDao = new GrupoDao();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("button");
		String saida = "";
		String erro = "";
		List<Grupo> listaGrupos = new ArrayList<Grupo>();
		Grupo grup = validaCampos(request, cmd);
		
		try {
			if (cmd.contains("Cadastrar")) {
				if (grup != null) {
					saida = gDao.insertGrupo(grup);
					grup = new Grupo();
				}
			}
			if (cmd.contains("Atualizar")) {
				if (grup != null) {
					saida = gDao.updateGrupo(grup);
					grup = new Grupo();
				}
			}
			if (cmd.contains("Excluir")) {
				if (grup != null) {
					saida = gDao.deleteGrupo(grup);
					grup = new Grupo();
				}
			}
			if (cmd.contains("Buscar")) {
				if (grup != null) {
					grup = gDao.selectGrupo(grup);
				}
			}
			if (cmd.contains("Listar")) {
				if (grup != null) {
					listaGrupos = gDao.selectGrupos();
				}
				
			}
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			request.setAttribute("grupo", grup);
			request.setAttribute("listaGrupos", listaGrupos);
			RequestDispatcher rd = request.getRequestDispatcher("grupo.jsp");
			rd.forward(request, response);
		}
	}

	private Grupo validaCampos(HttpServletRequest request, String cmd) {
		Grupo grup = new Grupo();
		if (cmd.contains("Cadastrar") || cmd.contains("Atualizar")) {
			if (!request.getParameter("id").trim().isEmpty() &&
					!request.getParameter("letra").trim().isEmpty() &&
					!request.getParameter("codigotimegrupo").trim().isEmpty()) {
				grup.setId(Integer.parseInt(request.getParameter("id").trim()));
				grup.setLetra(request.getParameter("letra").trim());
				grup.setCodigotimegrupo(Integer.parseInt(request.getParameter("codigotimegrupo").trim()));
			}
		}
		if (cmd.contains("Excluir") || cmd.contains("Buscar")) {
			if (!request.getParameter("id").trim().isEmpty()) {
				grup.setId(Integer.parseInt(request.getParameter("id").trim()));
			}
		}
		return grup;
	}	

}
