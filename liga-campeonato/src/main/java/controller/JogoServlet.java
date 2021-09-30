package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Grupo;
import model.Jogo;
import persistence.JogoDao;
import persistence.IGrupoDao;
import persistence.IJogoDao;

@WebServlet("/jogo")
public class JogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IJogoDao jDao;
	private IGrupoDao gDao;
       
    public JogoServlet() {
    	try {
    		jDao = new JogoDao();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("button");
		String saida = "";
		String erro = "";
		List<Jogo> listaJogos = new ArrayList<Jogo>();
		List<Grupo> listaTabelas = new ArrayList<Grupo>();
		Jogo jogo = validaCampos(request, cmd);
		
		try {
			if (cmd.contains("Cadastrar")) {
				if (jogo != null) {
					saida = jDao.insertJogo(jogo);
					jogo = new Jogo();
				}
			}
			if (cmd.contains("Atualizar")) {
				if (jogo != null) {
					saida = jDao.updateJogo(jogo);
					jogo = new Jogo();
				}
			}
			if (cmd.contains("Excluir")) {
				if (jogo != null) {
					saida = jDao.deleteJogo(jogo);
					jogo = new Jogo();
				}
			}
			if (cmd.contains("Buscar")) {
				if (jogo != null) {
					jogo = jDao.selectJogo(jogo);
				}
			}
			if (cmd.contains("Listar")) {
				if (jogo != null) {
					listaJogos = jDao.selectJogos();
				}
			}
			if (cmd.contains("Dividir Grupos")) {
				if (jogo != null) {
					saida = jDao.divideGrupos();
				}
			}
			if (cmd.contains("Tabelas")) {
				if (jogo != null) {
					listaTabelas = gDao.selectGrupos();
				}
			}
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			request.setAttribute("jogo", jogo);
			request.setAttribute("listaJogos", listaJogos);
			RequestDispatcher rd = request.getRequestDispatcher("jogo.jsp");
			rd.forward(request, response);
		}
	}

	private Jogo validaCampos(HttpServletRequest request, String cmd) {
		Jogo jogo = new Jogo();
		if (cmd.contains("Cadastrar") || cmd.contains("Atualizar")) {
			if (!request.getParameter("idjogo").trim().isEmpty() &&
					!request.getParameter("codigotimea").trim().isEmpty() &&
					!request.getParameter("codigotimeb").trim().isEmpty()) {
				jogo.setIdjogo(Integer.parseInt(request.getParameter("idjogo").trim()));
				jogo.setCodigotimea(Integer.parseInt(request.getParameter("codigotimea").trim()));
				jogo.setCodigotimeb(Integer.parseInt(request.getParameter("codigotimeb").trim()));
			}
		}
		if (cmd.contains("Excluir") || cmd.contains("Buscar")) {
			if (!request.getParameter("idjogo").trim().isEmpty()) {
				jogo.setIdjogo(Integer.parseInt(request.getParameter("idjogo").trim()));
			}
		}
		return jogo;
	}	

}
