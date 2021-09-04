using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Persona.Context;
using Persona.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Persona.Controllers
{
    [EnableCors("cors")]
    [Route("api/[controller]")]
    [ApiController]
    public class PersonaController : ControllerBase
    {
        private readonly AppDbContext context;
        public PersonaController(AppDbContext context)
        {
            this.context = context;
        }
        // GET: api/<PersonaController>
        [HttpGet]
        public IEnumerable<Personas> Get()
        {
            return context.Personas.ToList();
        }

        // GET api/<PersonaController>/5
        [HttpGet("{id}")]
        public Personas Get(int id)
        {
            return context.Personas.FirstOrDefault(p => p.id == id);
        }

        // POST api/<PersonaController>
        [HttpPost]
        public ActionResult Post([FromBody] Personas p)
        {
            try
            {
                if (p.id != 0)
                {
                    p.id = 0;
                }
                context.Personas.Add(p);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();

                throw;
            }
        }

        // PUT api/<PersonaController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id,[FromBody] Personas p)
        {
            if (p.id == id) { 
                context.Entry<Personas>(p).State = EntityState.Modified;
                context.SaveChanges();
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        // DELETE api/<PersonaController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var pro = context.Personas.FirstOrDefault(p => p.id == id);
            if (pro != null)
            {
                context.Personas.Remove(pro);
                context.SaveChanges();
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
