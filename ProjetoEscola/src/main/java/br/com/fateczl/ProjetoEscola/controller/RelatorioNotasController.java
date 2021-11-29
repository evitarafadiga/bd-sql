package br.com.fateczl.ProjetoEscola.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.fateczl.ProjetoEscola.persistence.GenericDao;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
public class RelatorioNotasController {

	@Autowired
	GenericDao gDao;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(name = "relatorio", value = "/relatorio", method = RequestMethod.POST)
	public ResponseEntity geraRelatorio(@RequestParam Map<String, String> allRequestParams) {
		
		String cmd = allRequestParams.get("button");
		String erro = "";
		
		Map<String, Object> param = new HashMap<String, Object>();
		byte[] bytes = null;
		InputStreamResource resource = null;
		HttpStatus status = null;
		HttpHeaders header = new HttpHeaders();
		
		Map<String, Object> param1 = new HashMap<String, Object>();
		byte[] bytes1 = null;
		InputStreamResource resource1 = null;
		HttpStatus status1 = null;
		HttpHeaders header1 = new HttpHeaders();
		
        switch(cmd) {
        case "Gerar Relatorio de Notas":
        	try {
    			Connection conn = gDao.getConnection();
    			File arquivo = ResourceUtils.getFile("classpath:relatorionotas.jasper");
    			JasperReport report = 
    					(JasperReport) JRLoader.loadObjectFromFile(arquivo.getAbsolutePath());
    			bytes = JasperRunManager.runReportToPdf(report, param, conn);
    		} catch (FileNotFoundException | JRException | ClassNotFoundException | SQLException e) {
    			erro = e.getMessage();
    			status = HttpStatus.BAD_REQUEST;
    		} finally {
    			if (erro.equals("")) {
    				InputStream inputStream = new ByteArrayInputStream(bytes);
    				resource = new InputStreamResource(inputStream);
    				header.setContentLength(bytes.length);
    				header.setContentType(MediaType.APPLICATION_PDF);
    				status = HttpStatus.OK;
    			}
    		}
    		
    		return new ResponseEntity(resource, header, status);
        case "Gerar Relatorio de Presencas":
        	try {
    			Connection conn = gDao.getConnection();
    			File arquivo = ResourceUtils.getFile("classpath:relatoriopresencas.jasper");
    			JasperReport report = 
    					(JasperReport) JRLoader.loadObjectFromFile(arquivo.getAbsolutePath());
    			bytes1 = JasperRunManager.runReportToPdf(report, param1, conn);
    		} catch (FileNotFoundException | JRException | ClassNotFoundException | SQLException e) {
    			erro = e.getMessage();
    			status1 = HttpStatus.BAD_REQUEST;
    		} finally {
    			if (erro.equals("")) {
    				InputStream inputStream = new ByteArrayInputStream(bytes1);
    				resource1 = new InputStreamResource(inputStream);
    				header1.setContentLength(bytes1.length);
    				header1.setContentType(MediaType.APPLICATION_PDF);
    				status1 = HttpStatus.OK;
    			}
    		}
    		
    		return new ResponseEntity(resource1, header1, status1);
        default:
        	return new ResponseEntity(resource, header, status);
        }
		
	}
	
}
