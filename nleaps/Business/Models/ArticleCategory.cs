using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace nleaps
{
    public class ArticleCategory:IKeyID
    {
        [Key]
        public int ID { get; set; }

        [Required, StringLength(50)]
        public string Name { get; set; }

        public int sort { get; set; }

        public DateTime? CreateTime { get; set; }

        public virtual ArticleCategory Parent { get; set; }
        public virtual ICollection<ArticleCategory> Children { get; set; }
    }
}