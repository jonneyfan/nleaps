using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nleaps
{
    public class ArticleCategoryHelper
    {
        private static List<ArticleCategory> _articlecategorys;

        public static List<ArticleCategory> ArticleCategorys
        {
            get
            {
                if (_articlecategorys == null)
                {
                    InitArticleCategorys();
                }
                return _articlecategorys;
            }
        }

        public static void Reload()
        {
            _articlecategorys = null;
        }

        private static void InitArticleCategorys()
        {
            _articlecategorys = new List<ArticleCategory>();

            List<ArticleCategory> dbArticleCategorys = PageBase.DB.ArticleCategorys.OrderBy(a => a.sort).ToList();

            ResolveArticleCategoryCollection(dbArticleCategorys, null, 0);
        }

        private static int ResolveArticleCategoryCollection(List<ArticleCategory> dbArticleCategorys, ArticleCategory parentArticleCategory, int level)
        {
            int count = 0;
            foreach (var articlecategory in dbArticleCategorys.Where(a => a.Parent == parentArticleCategory))
            {
                count++;

                _articlecategorys.Add(articlecategory);
                articlecategory.TreeLevel = level;
                articlecategory.IsTreeLeaf = true;
                articlecategory.Enabled = true;

                level++;
                // 如果这个节点下没有子节点，则这是个终结节点
                int childCount = ResolveArticleCategoryCollection(dbArticleCategorys, articlecategory, level);
                if (childCount != 0)
                {
                    articlecategory.IsTreeLeaf = false;
                }
                level--;

            }

            return count;
        }

    }
}