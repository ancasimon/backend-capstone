using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class Game
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<string> Songs { get; set; }
        public List<string> Keywords { get; set; }
        public string Description { get; set; }
        public string Prwork { get; set; }
        public int PreworkLevelId { get; set; }
        public string Instructions { get; set; }
        public string Credit { get; set; }
        public string WebsiteUrl { get; set; }
        public int OverallRating { get; set; }
        public int SubmittedByUserId { get; set; }
        public bool IsActive { get; set; }
        public DateTime DateCreated { get; set; }
        public int IconId { get; set; }
    }
}
