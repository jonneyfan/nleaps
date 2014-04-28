using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace nleaps
{
    public class Article:IKeyID
    {
        [Key]
        public int ID { get; set; }

        [Required, StringLength(50)]
        public string Title { get; set; }
        [StringLength(50)]
        public string Name { get; set; }
        public DateTime? CreateTime { get; set; }
        public DateTime? UpdateTime { get; set; }
  

        [StringLength(5000)]
        public string Content { get; set; }
        public string KeyWord { get; set; }

        public ArticleCategory ArticleCategory { get; set; }
    }
}