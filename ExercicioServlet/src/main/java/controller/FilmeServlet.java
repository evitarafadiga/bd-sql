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

import model.Jogo;
import persistence.FilmeDao;
import persistence.IFilmeDao;

@WebServlet("/filme")
public class FilmeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IFilmeDao fDao;
       
    public FilmeServlet() {
    	try {
    		fDao = new FilmeDao();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("button");
		String saida = "";
		String erro = "";
		List<Jogo> listaFilmes = new ArrayList<Jogo>();
		Jogo film = validaCampos(request, cmd);
		
		try {
			if (cmd.contains("Cadastrar")) {
				if (film != null) {
					saida = fDao.insertFilme(film);
					film = new Jogo();
				}
			}
			if (cmd.contains("Atualizar")) {
				if (film != null) {
					saida = fDao.updateFilme(film);
					film = new Jogo();
				}
			}
			if (cmd.contains("Excluir")) {
				if (film != null) {
					saida = fDao.deleteFilme(film);
					film = new Jogo();
				}
			}
			if (cmd.contains("Buscar")) {
				if (film != null) {
					film = fDao.selectFilme(film);
				}
			}
			if (cmd.contains("Listar")) {
				if (film != null) {
					listaFilmes = fDao.selectFilmes();
				}
				
			}
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			request.setAttribute("filme", film);
			request.setAttribute("listaFilmes", listaFilmes);
			RequestDispatcher rd = request.getRequestDispatcher("filme.jsp");
			rd.forward(request, response);
		}
	}

	private Jogo validaCampos(HttpServletRequest request, String cmd) {
		Jogo film = new Jogo();
		if (cmd.contains("Cadastrar") || cmd.contains("Atualizar")) {
			if (!request.getParameter("idfilme").trim().isEmpty() &&
					!request.getParameter("nomeBR").trim().isEmpty() &&
					!request.getParameter("anoLancamento").trim().isEmpty()) {
				film.setIdfilme(Integer.parseInt(request.getParameter("idfilme").trim()));
				film.setNomeBR(request.getParameter("nomeBR").trim());
				film.setNomeEN(request.getParameter("nomeEN").trim());
				film.setAnoLancamento(Integer.parseInt(request.getParameter("anoLancamento").trim()));
				film.setSinopse(request.getParameter("sinopse").trim());
			}
		}
		if (cmd.contains("Excluir") || cmd.contains("Buscar")) {
			if (!request.getParameter("idfilme").trim().isEmpty()) {
				film.setIdfilme(Integer.parseInt(request.getParameter("idfilme").trim()));
			}
		}
		return film;
	}	

}
