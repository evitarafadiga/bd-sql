package br.com.fateczl.ProjetoEscola.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
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

import br.com.fateczl.ProjetoEscola.model.Aluno;
import br.com.fateczl.ProjetoEscola.model.Faltas;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDao;
import br.com.fateczl.ProjetoEscola.persistence.DisciplinaDao;
import br.com.fateczl.ProjetoEscola.persistence.FaltaDao;

@Controller
public class FazerChamadaController {
	
	@Autowired
	AlunoDao aDao;
	
	@Autowired
	DisciplinaDao dDao;
	
	@Autowired
	FaltaDao fDao; //
	
	//GET
	@RequestMapping(name = "chamada", value = "/chamada", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		String erro = "";
		try {
			listaAlunos = aDao.listaAlunos();
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaAlunos", listaAlunos);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("chamada");
	}
	
	//POST
	@RequestMapping(name = "chamada", value = "/chamada", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam, 
			ModelMap model) {
		Faltas f = new Faltas();
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		for (String key : allRequestParam.keySet()) {
			if (key.equals("ra")) {
				f.setPresenca('P');
				f.setDataf(Date.valueOf(LocalDate.now()));
			} else {
				try {
					if (!allRequestParam.get(key).equals("")) {
						int numericKey = Integer.parseInt(key);
						
						Aluno a = new Aluno();
						
						Faltas fa = new Faltas();
						fa.setAluno(a);
						//fa.setDisciplina();
						fa.setDataf(Date.valueOf(LocalDate.now()));
						fa.setPresenca('P');
					}
					
				} catch (NumberFormatException e) {}
			}
		}
		try {
			fDao.insereFalta(f);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			
		}
		
	}

}
