using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace nleaps
{
    public class DocConsult : IKeyID
    {
        [Key]
        public int ID { get; set; }

        [Required, StringLength(50)]
        public string Header { get; set; }//文件标题

        [Required, StringLength(50)]
        public string ReleaseDept { get; set; }//发布单位

        [Required, StringLength(50)]
        public string ReleaseDateTime { get; set; }//发布时间


        public virtual ICollection<User> Users { get; set; }



    }
}