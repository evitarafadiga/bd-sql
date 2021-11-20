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

import br.com.fateczl.ProjetoEscola.model.AlunoDisciplina;
import br.com.fateczl.ProjetoEscola.model.Disciplina;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDisciplinaDao;

@Controller
public class ListaChamadaController {
	
	@Autowired
	AlunoDisciplinaDao adDao;
	
	@RequestMapping (name = "lista", value = "/lista", method = RequestMethod.GET)
	public ModelAndView init() {
		return new ModelAndView("lista");
	}
	
	@RequestMapping (name = "lista", value = "/lista", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam,
			ModelMap model) {
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		int codigoDisciplina = Integer.parseInt(allRequestParam.get("codigoDisciplina"));
		String erro = "";
		
		Disciplina d = new Disciplina();
		d.setCodigo(codigoDisciplina);
		
		AlunoDisciplina ad = new AlunoDisciplina();
		ad.setDisciplina(d);
		try {
			listaAlunoDisciplina = adDao.listaFaltas(ad);
		} catch (ClassNotFoundException | SQLException e ) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaAlunoDisciplina", listaAlunoDisciplina);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("lista");
	}

}
