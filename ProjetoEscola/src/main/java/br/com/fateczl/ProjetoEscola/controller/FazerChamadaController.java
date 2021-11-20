package br.com.fateczl.ProjetoEscola.controller;

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
import br.com.fateczl.ProjetoEscola.model.AlunoDisciplina;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDao;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDisciplinaDao;
import br.com.fateczl.ProjetoEscola.persistence.DisciplinaDao;

@Controller
public class FazerChamadaController {
	
	@Autowired
	AlunoDao aDao;
	
	@Autowired
	DisciplinaDao dDao;
	
	@Autowired
	AlunoDisciplinaDao adDao; //
	
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
		AlunoDisciplina ad = new AlunoDisciplina();
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		for (String key : allRequestParam.keySet()) {
			if (key.equals("ra")) {
				ad.setPresenca('P');
				ad.setDataf(String.valueOf(LocalDate.now()));
			} else {
				try {
					if (!allRequestParam.get(key).equals("")) {
						int numericKey = Integer.parseInt(key);
						
						Aluno a = new Aluno();
						
						AlunoDisciplina ad2 = new AlunoDisciplina();
						ad2.setAluno(a);
						//fa.setDisciplina();
						ad2.setDataf(String.valueOf(LocalDate.now()));
						ad2.setPresenca('P');
					}
					
				} catch (NumberFormatException e) {}
			}
		}
		try {
			adDao.insereFalta(ad);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			
		}
		return new ModelAndView("chamada");
	}

}
