using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class PracticePlanGameWithGameName
    {
        public int Id { get; set; }
        public int PracticePlanId { get; set; }
        public string PracticeName { get; set; }
        public DateTime PracticeDate { get; set; }
        public string UserNotes { get; set; }
        public bool IsCompleted { get; set; }
        public bool IsActive { get; set; }
        public string GameName { get; set; }
        public int GameId { get; set; }
    }
}
