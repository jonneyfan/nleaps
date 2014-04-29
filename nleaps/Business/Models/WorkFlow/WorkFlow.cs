using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using nleaps.Business.Models.Form;

namespace nleaps.Business.Models.WorkFlow
{
    public class WorkFlow:IKeyID
    {
        [Key]
        public int ID { get;set;}
        [StringLength(50)]
        public string WorkFlowName { get; set; }
        [StringLength(50)]
        public string FormName { get; set; }
      
        [StringLength(2000)]
        public string Content { get; set; }//简介JianJie
        
        public virtual User User{ get ; set;}
        public virtual FormType FormType { get; set; }
        public DateTime? CreateTime { get; set; }
        //public virtual ICollection<User> UserList { get; set; }
    }
}