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
import br.com.fateczl.ProjetoEscola.model.Disciplina;
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
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		
		String erro = "";
		try {
			listaAlunos = aDao.listaAlunos();
			listaAlunoDisciplina = adDao.listaDeFaltas();
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaAlunoDisciplina", listaAlunoDisciplina);
			model.addAttribute("listaAlunos", listaAlunos);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("chamada");
	}
	
	//POST
	@RequestMapping(name = "chamada", value = "/chamada", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam, 
			ModelMap model) {
		Disciplina d = new Disciplina();
		AlunoDisciplina ad = new AlunoDisciplina();
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		
		for (String key : allRequestParam.keySet()) {
				if (key.equals("codigoDisciplina")) {
					if (key.equals("dataf")) {

						d.setCodigo(Integer.parseInt(allRequestParam.get(key)));
						d.setNum_aulas(Integer.parseInt(allRequestParam.get(key)));
						ad.setDisciplina(d);
						ad.setPresenca('P');
						ad.setDataf(allRequestParam.get(key));
					} else {
						try {
							if (!allRequestParam.get(key).equals("")) {
								int numericKey = Integer.parseInt(key);
								
								d.setCodigo(numericKey);
								d.setNum_aulas(Integer.parseInt(allRequestParam.get(key)));
								
								AlunoDisciplina ad2 = new AlunoDisciplina();
								ad2.setDisciplina(d);
								ad2.setDataf(LocalDate.now().toString());
								ad2.setPresenca('F');
								listaAlunoDisciplina.add(ad2);
							}
							
						} catch (NumberFormatException e) {}
					}
				
			}
			
		}
		try {
			dDao.insereDisciplina(d);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
		
		for (AlunoDisciplina ad1 : listaAlunoDisciplina) {
			try {
				adDao.inserePresenca(ad1);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				}
			}
		
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		String erro = "";
		try {
			listaAlunos = aDao.listaAlunos();
			listaAlunoDisciplina = adDao.listaFaltaPorDisciplina(ad);
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaAlunos", listaAlunos);
			model.addAttribute("listaAlunoDisciplina", listaAlunoDisciplina);
			model.addAttribute("erro", erro);
		}
		
		return new ModelAndView("chamada");
	}

}
