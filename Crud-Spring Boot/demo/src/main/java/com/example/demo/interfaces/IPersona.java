package com.example.demo.interfaces;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelo.*;
@Repository
public interface IPersona extends CrudRepository<Persona,Integer> {

}
