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

    }
}
