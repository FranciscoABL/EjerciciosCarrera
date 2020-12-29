package com.example.demo.interfacesServices;

import java.util.List;
import java.util.Optional;
import com.example.demo.modelo.*;
public interface IPersonaService {
	public List<Persona>listar();
	public Optional<Persona>listarId(int id);
	public int save(Persona p);
	public void delete(int id);
}
