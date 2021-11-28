package br.com.fateczl.ProjetoEscola.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.fateczl.ProjetoEscola.model.Disciplina;
import br.com.fateczl.ProjetoEscola.model.Notas;
import br.com.fateczl.ProjetoEscola.persistence.NotasDao;

@Controller
public class ListaNotasController {
	
	@Autowired
	NotasDao nDao;
	
	@RequestMapping (name = "listanotas", value = "/listanotas", method = RequestMethod.GET)
	public ModelAndView init() {
		return new ModelAndView("listanotas");
	}
	
	@RequestMapping (name = "listanotas", value = "/listanotas", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam,
			ModelMap model) {
		List<Notas> listaNotas = new ArrayList<Notas>();
		int codigoDisciplina = Integer.parseInt(allRequestParam.get("codigoDisciplina"));
		String erro = "";
		
		Disciplina d = new Disciplina();
		d.setCodigo(codigoDisciplina);
		
		Notas n = new Notas();
		n.setDisciplina(d);
		try {
			listaNotas = nDao.listaNotasPorDisciplina(n);
		} catch (ClassNotFoundException | SQLException e ) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaNotas", listaNotas);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("listanotas");
	}

}
