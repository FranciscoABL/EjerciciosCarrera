//Barraza Lugo Francisco Antonio - Tutorial Crud En Spring boot - https://www.youtube.com/watch?v=ywCkhh-PQ0U&ab_channel=SinFloo
//Muy interesante el manejo del controlador,aprendi a colocar las llaves por encima de los metodos y clases @
//Y el Manejo de la estructura DAO
package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.interfacesServices.IPersonaService;
import com.example.demo.modelo.Persona;

@Controller
@RequestMapping
public class Controlador {
	@Autowired
	private IPersonaService service;
	@GetMapping("/listar")
	public String listar(Model model) {
		List<Persona>personas=service.listar();
		model.addAttribute("personas",personas);
		
		return "index";
	}
	@GetMapping("/new")
	public String agregar(Model model) {
		model.addAttribute("persona",new Persona());
		
		return "formulario";
	}
	@PostMapping("/save")
	public String save(@Validated Persona p,Model model) {
		service.save(p);
		return "redirect:/listar";
		
	}
	@GetMapping("/editar/{id}")
	public String editar(@PathVariable int id,Model model) {
		Optional<Persona>persona=service.listarId(id);
		model.addAttribute("persona",persona);
		return "formulario";
		
	}
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable int id,Model model) {
		service.delete(id);
		return "redirect:/listar";
	}

}
