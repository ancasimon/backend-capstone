using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class GameInstrument
    {
        public int Id { get; set; }
        public int GameId { get; set; }
        public int InstrumentId { get; set; }
    }
}
