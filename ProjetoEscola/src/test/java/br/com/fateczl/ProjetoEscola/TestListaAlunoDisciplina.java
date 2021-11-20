package br.com.fateczl.ProjetoEscola;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.fateczl.ProjetoEscola.model.Aluno;
import br.com.fateczl.ProjetoEscola.model.AlunoDisciplina;
import br.com.fateczl.ProjetoEscola.model.Disciplina;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDao;
import br.com.fateczl.ProjetoEscola.persistence.AlunoDisciplinaDao;

public class TestListaAlunoDisciplina {
	
	@Autowired
	AlunoDisciplinaDao adDao;
	
	@Autowired
	AlunoDao aDao;

	@Test
	void contextLoads() {
		List<AlunoDisciplina> listaAlunoDisciplina = new ArrayList<AlunoDisciplina>();
		List<Aluno> listaAlunos = new ArrayList<Aluno>();
		int codigoDisciplina = 4203010;
		String ra = "1110481822034";
		Aluno a = new Aluno();
		a.setRa(ra);
		
		Disciplina d = new Disciplina();
		d.setCodigo(codigoDisciplina);
		
		AlunoDisciplina ad = new AlunoDisciplina();
		ad.setDisciplina(d);
	
		try {
			listaAlunoDisciplina = adDao.listaFaltas(ad);
			a = aDao.consultaAluno(a);
			listaAlunos = aDao.listaAlunos();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			System.out.println(listaAlunoDisciplina.toString());
			System.out.println(a.toString());
			System.out.println(listaAlunos.toString());
		}
		
		
	}

}
