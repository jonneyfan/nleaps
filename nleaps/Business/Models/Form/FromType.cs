using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace nleaps.Business.Models.Form
{
    public class FromType : IKeyID
    {
        [Key]
        public int ID { get; set; }

        [StringLength(50)]
        public string TypeName { get; set; }

    }
}