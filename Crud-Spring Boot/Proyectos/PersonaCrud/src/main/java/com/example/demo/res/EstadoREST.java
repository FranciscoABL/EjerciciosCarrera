/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.res;
import com.example.demo.models.Estado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



import com.example.demo.service.EstadoService;
import java.util.List;

@RestController
@RequestMapping ("/estados/")
public class EstadoREST {
	
	@Autowired
	private EstadoService estadoService;
	
	@GetMapping ("{id}")
	private ResponseEntity<List<Estado>> getAllEstadosByPais (@PathVariable("id") Long idPais){
		return ResponseEntity.ok(estadoService.findAllByCountry(idPais));
		
	}

}