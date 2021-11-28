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
import br.com.fateczl.ProjetoEscola.model.Avaliacao;
import br.com.fateczl.ProjetoEscola.model.Disciplina;
import br.com.fateczl.ProjetoEscola.model.Notas;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDao;
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
	
	//GET
	@RequestMapping(name = "notas", value = "/notas", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		List<Notas> listaNotas = new ArrayList<Notas>();
		
		String erro = "";
		try {
			listaNotas = nDao.listaNotas();
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("listaNotas", listaNotas);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("notas");
	}
	
	//POST
	@RequestMapping(name = "notas", value = "/notas", method = RequestMethod.POST)
	public ModelAndView op(@RequestParam Map<String, String> allRequestParam, 
			ModelMap model) {
		
		List<Notas> listaNotas = new ArrayList<Notas>();
		int cod = Integer.parseInt(allRequestParam.get("codigoDisciplina"));
		int codav = Integer.parseInt(allRequestParam.get("codigoAvaliacao"));
		String tp = allRequestParam.get("tipo");
		Double nota;
		String cmd = allRequestParam.get("button");
		
		String erro = "";
		
        switch(cmd) {
            case "Inserir":
            	
            	for (String key : allRequestParam.keySet()) {
            		
            		if (key.contains("111048")) {
            			System.out.println(key);
            			nota = Double.valueOf(allRequestParam.get(key));
            			
            			Aluno a = new Aluno();
            			Disciplina d = new Disciplina();
            			Avaliacao av = new Avaliacao();
            			Notas n = new Notas();
            			
            			d.setCodigo(cod);
        				a.setRa(key);
        				av.setCodigo_a(codav);
        				av.setTipo(tp);
        				n.setAluno(a);
            			n.setDisciplina(d);
            			n.setNota(nota);
            			n.setAvaliacao(av);
            			
            			System.out.println(n.toString());
            			try {
            				nDao.insereNota(n);
            			} catch (ClassNotFoundException | SQLException e) {
            				e.printStackTrace();
            			}
            		}
            	}
        		return new ModelAndView("notas");
            case "Buscar":
            	Disciplina d = new Disciplina();
    			Avaliacao av = new Avaliacao();
    			Notas n = new Notas();
    			
    			d.setCodigo(cod);
            	av.setCodigo_a(codav);
            	av.setTipo(tp);
        		n.setAvaliacao(av);
        		n.setDisciplina(d);
        		
        		System.out.println(n.toString());
        		
            	try {
        			listaNotas = nDao.listaNotasPorAvaliacao(n);
        			} catch (ClassNotFoundException | SQLException e) {
        			erro = e.getMessage();
        			} finally {
        			model.addAttribute("listaNotas", listaNotas);
        			model.addAttribute("erro", erro);
        			}

        		return new ModelAndView("notas");
            default:
        		return new ModelAndView("notas");
        }
        
	}


}
