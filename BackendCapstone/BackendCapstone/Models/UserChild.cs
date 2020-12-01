using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class UserChild
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string ChildName { get; set; }
        public DateTime ChildBirthday { get; set; }
        public int ChildOrder { get; set; } 
    }
}
