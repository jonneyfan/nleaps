using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;



namespace nleaps.Business.Models.WorkFlow
{
    public class ToDo:IKeyID
    {
        [Key]
        public int ID { get; set; }
        [StringLength(200)]
        public string WorkName { get; set; }
        [StringLength(200)]
        public string FormName { get; set; }
        public virtual User UserName { get; set; }
        public DateTime? CreateTime { get; set; }
        
        [StringLength(8000)]
        public string FormContent { get; set; }
        public virtual WorkFlowWork AttachmentList { get; set; }
        [StringLength(8000)]
        public string ReviewOpinion { get; set; }//审评意见
       
        
        [StringLength(50)]
        public string StateNoe { get; set; }
        public DateTime? UpdateTime { get; set; }
        public virtual WorkFlow WorkFlowID { get; set; }
        public virtual WorkFlowNode NodeID { get; set; }
        
       
        public virtual WorkFlowNode NodeName { get; set; }
        public virtual User ApproveUserList { get; set; }//审评人列表
        public virtual User PassUserList { get; set; }//通过人列表
        

       

    }
}