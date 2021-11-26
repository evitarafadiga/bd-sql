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
import br.com.fateczl.ProjetoEscola.model.Avaliacao;
import br.com.fateczl.ProjetoEscola.model.Notas;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDao;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDisciplinaDao;
import br.com.fateczl.ProjetoEscola.persistence.DisciplinaDao;
import br.com.fateczl.ProjetoEscola.persistence.NotasDao;

@Controller
public class AdicionarNotasController {

	@Autowired
	AlunoDao aDao;
	
	@Autowired
	DisciplinaDao dDao;
	
	@Autowired
	NotasDao nDao;
	
	@Autowired
	AlunoDisciplinaDao adDao; //
	
	//GET
	@RequestMapping(name = "notas", value = "/notas", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		List<Notas> listaNotas = new ArrayList<Notas>();
		Notas n = new Notas();
		String erro = "";
		try {
			listaNotas = nDao.listaNotas(n);
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaNotas", listaNotas);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("chamada");
	}
	
	//POST
	@RequestMapping(name = "notas", value = "/notas", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam, 
			ModelMap model) {
		Avaliacao av = new Avaliacao();
		Notas n = new Notas();
		AlunoDisciplina ad = new AlunoDisciplina();
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		
		for (String key : allRequestParam.keySet()) {
				if (key.equals("codigoAvaliacao")) {
					
					av.setCodigo(Integer.parseInt(allRequestParam.get(key)));
					
					ad.setPresenca('P');
					ad.setDataf("datepicker");
					ad.setDataf(String.valueOf(LocalDate.now()));
				} else {
					try {
						if (!allRequestParam.get(key).equals("")) {
							int numericKey = Integer.parseInt(key);
							
							av.setCodigo(numericKey);
							
							AlunoDisciplina ad2 = new AlunoDisciplina();
							//ad2.setDisciplina(d);
							ad2.setDataf(String.valueOf(LocalDate.now()));
							ad2.setPresenca('F');
							listaAlunoDisciplina.add(ad2);
						}
						
					} catch (NumberFormatException e) {}
				
			}
			
		}
		try {
			nDao.insereNota(n);
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
			listaAlunoDisciplina = adDao.listaFaltas(ad);
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
