using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class GameRepository
    {
        static List<Game> games = new List<Game>();
        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<Game> GetAllActiveGames()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllGames = "select * from Games where IsActive = 1";

            var allActiveGames = db.Query<Game>(sqlForAllGames);

            return allActiveGames;
        }

        public Game GetGameById(int id)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForSingleGameById = "select * from Games where Id = @id";
            var parameterForGameId = new { Id = id };

            var selectedGame = db.QueryFirstOrDefault<Game>(sqlForSingleGameById, parameterForGameId);

            return selectedGame;
        }

    }
}
