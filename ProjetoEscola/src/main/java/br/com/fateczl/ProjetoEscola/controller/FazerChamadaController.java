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

	// GET
	@RequestMapping(name = "chamada", value = "/chamada", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		
		String erro = "";
		try {
			listaAlunos = aDao.listaAlunos();
			listaAlunoDisciplina = adDao.listaAlunos();
			
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaAlunoDisciplina", listaAlunoDisciplina);
			model.addAttribute("listaAlunos", listaAlunos);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("chamada");
	}

	// POST
	@RequestMapping(name = "chamada", value = "/chamada", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam, ModelMap model) {
		
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		int cod = Integer.parseInt(allRequestParam.get("codigoDisciplina"));
		int presenca;
		String dt = allRequestParam.get("datepicker");
		String cmd = allRequestParam.get("button");
		
		String erro = "";
		
        switch(cmd) {
            case "Finalizar Chamada":
            	
            	for (String key : allRequestParam.keySet()) {
            		
            		if (key.contains("111048")) {
            			
            			presenca = Integer.parseInt(allRequestParam.get(key));
            			
            			Aluno a = new Aluno();
            			Disciplina d = new Disciplina();
            			AlunoDisciplina ad = new AlunoDisciplina();
            			
            			d.setCodigo(cod);
        				a.setRa(key);
        				ad.setAluno(a);
            			ad.setDisciplina(d);
            			ad.setPresenca(presenca);
            			ad.setDataf(dt);
            			
            			System.out.println(ad.toString());
            			try {
            				adDao.inserePresenca(ad);
            			} catch (ClassNotFoundException | SQLException e) {
            				e.printStackTrace();
            			}
            		}
            	}
        		return new ModelAndView("chamada");
            case "Buscar":
    			Disciplina d = new Disciplina();
    			AlunoDisciplina ad = new AlunoDisciplina();

            	d.setCodigo(Integer.parseInt(allRequestParam.get("codigoDisciplina")));
        		ad.setDisciplina(d);
        		//ad.setPresenca(Integer.parseInt(allRequestParam.get("presenca")));
        		ad.setDataf(allRequestParam.get("datepicker"));
        		
            	try {
        			listaAlunoDisciplina = adDao.listaFaltaPorDisciplina(ad);
        			} catch (ClassNotFoundException | SQLException e) {
        			erro = e.getMessage();
        			} finally {
        			model.addAttribute("listaAlunoDisciplina", listaAlunoDisciplina);
        			model.addAttribute("erro", erro);
        			}

        		return new ModelAndView("chamada");
            default:
        		return new ModelAndView("chamada");
        }
		
	}

}
