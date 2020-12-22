using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Microsoft.Extensions.Configuration;

namespace BackendCapstone.DataAccess
{
    public class GameRepository
    {
        readonly string _connectionString;
        public GameRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public IEnumerable<Game> GetAllActiveGames()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllGames = @"select *
                                  from Games
                                  where IsActive = 1
                                  order by Name";

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

        public List<Game> GetLatestGames()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForLatestGames = @"select top 5 *
                                      from Games
                                      where IsActive = 1
                                      order by Id desc";
            var latestGames = db.Query<Game>(sqlForLatestGames);
            List<Game> latestGamesList = latestGames.ToList();

            return latestGamesList;
        }

    }
}
