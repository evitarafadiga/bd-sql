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

import model.Time;
import persistence.TimeDao;
import persistence.ITimeDao;

@WebServlet("/time")
public class TimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ITimeDao tDao;
       
    public TimeServlet() {
    	try {
    		tDao = new TimeDao();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("button");
		String saida = "";
		String erro = "";
		List<Time> listaTimes = new ArrayList<Time>();
		Time time = validaCampos(request, cmd);
		
		try {
			if (cmd.contains("Cadastrar")) {
				if (time != null) {
					saida = tDao.insertTime(time);
					time = new Time();
				}
			}
			if (cmd.contains("Atualizar")) {
				if (time != null) {
					saida = tDao.updateTime(time);
					time = new Time();
				}
			}
			if (cmd.contains("Excluir")) {
				if (time != null) {
					saida = tDao.deleteTime(time);
					time = new Time();
				}
			}
			if (cmd.contains("Buscar")) {
				if (time != null) {
					time = tDao.selectTime(time);
				}
			}
			if (cmd.contains("Listar")) {
				if (time != null) {
					listaTimes = tDao.selectTimes();
				}
				
			}
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			request.setAttribute("time", time);
			request.setAttribute("listaTimes", listaTimes);
			RequestDispatcher rd = request.getRequestDispatcher("time.jsp");
			rd.forward(request, response);
		}
	}

	private Time validaCampos(HttpServletRequest request, String cmd) {
		Time time = new Time();
		if (cmd.contains("Cadastrar") || cmd.contains("Atualizar")) {
			if (!request.getParameter("codigotime").trim().isEmpty() &&
					!request.getParameter("nometime").trim().isEmpty() &&
					!request.getParameter("cidade").trim().isEmpty()) {
				time.setCodigotime(Integer.parseInt(request.getParameter("codigotime").trim()));
				time.setNometime(request.getParameter("nometime").trim());
				time.setCidade(request.getParameter("cidade").trim());
				time.setEstadio(request.getParameter("estadio").trim());
			}
		}
		if (cmd.contains("Excluir") || cmd.contains("Buscar")) {
			if (!request.getParameter("codigotime").trim().isEmpty()) {
				time.setCodigotime(Integer.parseInt(request.getParameter("codigotime").trim()));
			}
		}
		return time;
	}	

}
