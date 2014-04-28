using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace nleaps.Business.Models.Form
{
    public class Form : IKeyID
    {
        [Key]
        public int ID { get; set; }

        [StringLength(50)]
        public string FormName { get; set; }

        [StringLength(50000)]
        public string Content { get; set; }

        public DateTime? CreateTime { get; set; }

        public virtual User User { get;set; }

        public virtual FormType FormType { get; set; }

        //public virtual ICollection<User> UserList { get; set; }
    }
}