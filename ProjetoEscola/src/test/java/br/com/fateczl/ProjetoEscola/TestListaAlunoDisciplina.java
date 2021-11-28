package br.com.fateczl.ProjetoEscola;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.fateczl.ProjetoEscola.model.Aluno;
import br.com.fateczl.ProjetoEscola.model.AlunoDisciplina;
import br.com.fateczl.ProjetoEscola.model.Avaliacao;
import br.com.fateczl.ProjetoEscola.model.Disciplina;
import br.com.fateczl.ProjetoEscola.model.Notas;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDao;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDisciplinaDao;
import br.com.fateczl.ProjetoEscola.persistence.NotasDao;

public class TestListaAlunoDisciplina {
	
	@Autowired
	AlunoDisciplinaDao adDao;
	
	@Autowired
	AlunoDao aDao;
	
	@Autowired
	NotasDao nDao;

	@Test
	void contextLoads() {
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		List<Notas> listaNotas = new ArrayList<Notas>();
		int codigoDisciplina = 4203010;
		Double nota = 8.0;
		String ra = "1110481822034";
		Aluno a = new Aluno();
		
		a.setRa(ra);
		
		Disciplina d = new Disciplina();
		d.setCodigo(codigoDisciplina);
		
		AlunoDisciplina ad = new AlunoDisciplina();
		ad.setDisciplina(d);
		
		Avaliacao av = new Avaliacao();
		av.setCodigo_a(1001);
		av.setTipo("P1");
		
		Notas n = new Notas();
		n.setAluno(a);
		n.setAvaliacao(av);
		n.setDisciplina(d);
		n.setNota(nota);
		try {
			/*
			listaAlunoDisciplina = adDao.listaFaltas(ad);
			a = aDao.consultaAluno(a);
			listaAlunos = aDao.listaAlunos(); */
			listaNotas = nDao.listaNotasPorAvaliacao(n);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			System.out.println(listaNotas.toString());
			
		}
		
		
	}

}
