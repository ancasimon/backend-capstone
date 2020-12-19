using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class PracticePlan
    {
        public int PlanId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public bool IsActive { get; set; }
        public List<PracticePlanGameWithGameName> plannedGames { get; set; } = new List<PracticePlanGameWithGameName>();
    }
}
