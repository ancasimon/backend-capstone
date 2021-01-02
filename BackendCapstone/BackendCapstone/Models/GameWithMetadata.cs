using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class GameWithMetadata
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

        // NEWLY ADDED TO THIS MODEL ONLY:
        public string PreworkLevelName { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string GameIconUrl { get; set; }
        public string GameIconHtml { get; set; }
        public List<Age> AgesForGame { get; set; } = new List<Age>();
        public List<Instrument> InstrumentsForGame { get; set; } = new List<Instrument>();
        public string UserPhotoUrl { get; set; }
        // adding the bool below to use to check if user can delete game:
        public bool HasAssociatedPracticePlanGames { get; set; }
        // new properties needed to pass the selected age and instrument IDs for the edit game form:
        public List<int> AgeIdsForGame { get; set; }
        public List<int> InstrumentIdsForGame { get; set; }

    }
}
