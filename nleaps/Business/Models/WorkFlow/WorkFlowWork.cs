using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace nleaps.Business.Models.WorkFlow
{
    public class WorkFlowWork:IKeyID
    {
        [Key]
        public int ID { get; set; }
        [StringLength(500)]
        public string Title { get; set; }
        [StringLength(8000)]
        public string Content { get; set; }
        [StringLength(2000)]
        public string Attachment { get; set; }
        
        [StringLength(8000)]
        public string PowerUser { get; set; }
        public DateTime? CreateTime { get; set; }
        public virtual User UserName { get; set; }
    }
}