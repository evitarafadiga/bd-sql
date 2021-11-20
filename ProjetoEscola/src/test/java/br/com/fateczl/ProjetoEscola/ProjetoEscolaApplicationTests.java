package br.com.fateczl.ProjetoEscola;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ProjetoEscolaApplicationTests {

	@Test
	void contextLoads() {
		testStringData();
	}
	
	public void testStringData() {
		String op = String.valueOf(LocalDate.now());
		System.out.println(op);
	}

}
