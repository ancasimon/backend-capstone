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
        //public List<string> Songs { get; set; }
        //public List<string> Keywords { get; set; }
        public string Songs { get; set; }
        public string Keywords { get; set; }
        public string Description { get; set; }
        public string Prework { get; set; }
        public int PreworkLevelId { get; set; }
        public string Instructions { get; set; }
        public string Credit { get; set; }
        public string WebsiteUrl { get; set; }
        public int OverallRating { get; set; }
        public int SubmittedByUserId { get; set; }
        public bool IsActive { get; set; }
        public DateTime DateCreated { get; set; }
        public int GameIconId { get; set; }
        public string PhotoUrl { get; set; }
        public int ImageFileId { get; set; }

        //added to support posting a new game with related gameInstrument and gameAge records simultaneously:
        public List<int> GameInstruments { get; set; }
        public List<int> GameAges { get; set; }
    }
}
