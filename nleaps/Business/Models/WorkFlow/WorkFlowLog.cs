using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace nleaps.Business.Models.WorkFlow
{
    public class WorkFlowLog:IKeyID
    {
        [Key]
        public int ID { get; set; }
        public virtual User UserName { get; set; }
        [StringLength(1000)]
        public string Title { get; set; }
        public DateTime? CreateTime { get; set; }
        [StringLength(50)]
        public string Type { get; set; }
        [StringLength(8000)]
        public string Content { get; set; }
    }
}