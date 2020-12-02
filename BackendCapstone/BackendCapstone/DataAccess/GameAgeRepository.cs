using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class GameAgeRepository
    {
        static List<GameAge> gameAges = new List<GameAge>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<GameAge> GetAgesForSelectedGame(int gameId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAgesForSelectedGame = @"select * 
                                              from GameAges ga
	                                            join Ages a
		                                            on ga.AgeId = a.Id
                                              where ga.GameId = @gameId";
            var parameterForGameId = new { GameId = gameId };

            var agesForGame = db.Query<GameAge>(sqlForAgesForSelectedGame, parameterForGameId);

            return agesForGame;
        }

    }
}
