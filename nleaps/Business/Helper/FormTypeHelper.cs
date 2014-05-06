using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;

namespace nleaps
{
    public class FormTypeHelper
    {
        private static List<FormType> _formtypes;

        public static List<FormType> FormTypes
        {
            get
            {
                if (_formtypes == null)
                {
                    InitFormTypes();
                }
                return _formtypes;
            }
        }

        public static void Reload()
        {
            _formtypes = null;
        }

        private static void InitFormTypes()
        {
            _formtypes = new List<FormType>();

            List<FormType> dbFormTypes = PageBase.DB.FormTypes.OrderBy(f => f.SortIndex).ToList();

            ResolveFormTypeCollection(dbFormTypes, null, 0);
        }

        private static int ResolveFormTypeCollection(List<FormType> dbFormTypes, FormType parentFormType, int level)
        {
            int count = 0;
            foreach (var formtype in dbFormTypes.Where(f => f.Parent == parentFormType))
            {
                count++;

                _formtypes.Add(formtype);
                formtype.TreeLevel = level;
                formtype.IsTreeLeaf = true;
                formtype.Enabled = true;

                level++;
                // 如果这个节点下没有子节点，则这是个终结节点
                int childCount = ResolveFormTypeCollection(dbFormTypes, formtype, level);
                if (childCount != 0)
                {
                    formtype.IsTreeLeaf = false;
                }
                level--;

            }

            return count;
        }

    }
}
