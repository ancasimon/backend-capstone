using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class GameInstrumentRepository
    {
        static List<GameInstrument> gameInstruments = new List<GameInstrument>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<GameInstrument> GetInstrumentsForSelectedGame(int gameId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForInstrumentsForSelectedGame = @"select *
                                                     from GameInstruments gi
	                                                    join Instruments i
		                                                    on gi.InstrumentId = i.Id
                                                    where gi.GameId = @gameId";
            var parameterForGameId = new { GameId = gameId };

            var instrumentsForGame = db.Query<GameInstrument>(sqlForInstrumentsForSelectedGame, parameterForGameId);

            return instrumentsForGame;
        }
    }
}
