using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class PracticePlanGame
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PracticePlanId { get; set; }
        public int GameId { get; set; }
        public string PracticeDate { get; set; }
        public string UserNotes { get; set; }
        public bool IsCompleted { get; set; }
        public bool IsActive { get; set; }
    }
}
