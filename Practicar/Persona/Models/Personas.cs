using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Persona.Models
{
    public class Personas
    {
        [Key]
        public int id { get; set; }
        public string nombre { get; set; }
        public int edad { get; set; }
    }
}
