using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using nleaps.Business.Models.Form;

namespace nleaps.Business.Models.WorkFlow
{
    public class WorkFlowNode:IKeyID
    {
        [Key]
        public int ID { get; set; }
        [StringLength(50)]
        public string NodeSeries { get; set; }
        [StringLength(50)]
        public string NodeName { get; set; }
        [StringLength(50)]
        public string NodeAddr { get; set; }
        [StringLength(50)]
        public string NextNodeSeries { get; set; }
        [StringLength(500)]
        public string ReviewModel { get; set; }//评审模式
        [StringLength(50)]
        public string ApproveUserSetting { get; set; }//审批用户设置
        public int TerminalHours { get; set; }//结束小时数
        [StringLength(50)]
        public string IFEditFile { get; set; }
        [StringLength(50)]
        public string IFDelFile { get; set; }
        [StringLength(8000)]
        public string ConditionsChange { get; set; }
        [StringLength(8000)]
        public string HandlerList { get; set; }

        public virtual WorkFlow WorkFlowID { get; set; }
    }
}