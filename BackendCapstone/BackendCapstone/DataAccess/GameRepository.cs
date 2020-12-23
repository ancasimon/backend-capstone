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

        public List<Game> GetMostPopularGames()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForPopularGames = @"select top 5 ppg.GameId as Id, g.Name, COUNT(ppg.Id) as Count
                                        from PracticePlanGames ppg
	                                        join Games g
	                                        on g.Id = ppg.GameId
                                        where ppg.IsActive = 1 
                                        AND g.IsActive = 1
                                        group by ppg.GameId, g.Name
                                        order by Count desc";
            var mostPopularGames = db.Query<Game>(sqlForPopularGames);
            List<Game> mostPopularGamesList = mostPopularGames.ToList();

            return mostPopularGamesList;
        }

        public Game AddNewGame(int userId, Game newGame)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForNewGame = @"INSERT INTO [dbo].[Games]
                                                   ([Name]
                                                   ,[IsActive]
                                                   ,[Songs]
                                                   ,[Description]
                                                   ,[PreworkLevelId]
                                                   ,[Prework]
                                                   ,[Instructions]
                                                   ,[Credit]
                                                   ,[WebsiteUrl]
                                                   ,[SubmittedByUserId]
                                                   ,[DateCreated]
                                                   ,[GameIconId]
                                                   ,[PhotoUrl]
                                                   ,[Keywords])
                                             OUTPUT INSERTED.Id
                                             VALUES
                                                   (@name
                                                   ,1
                                                   ,@songs
                                                   ,@description
                                                   ,@preworkLevelId
                                                   ,@prework
                                                   ,@instructions
                                                   ,@credit
                                                   ,@websiteUrl
                                                   ,@submittedByUserId
                                                   ,GETDATE()
                                                   ,@gameIconId
                                                   ,@photoUrl
                                                   ,@keywords)";
            var parametersForGame = new {
                name = newGame.Name, 
                songs = newGame.Songs,
                description = newGame.Description,
                preworkLevelId = newGame.PreworkLevelId,
                prework = newGame.Prework,
                instructions = newGame.Instructions,
                credit = newGame.Credit,
                websiteUrl = newGame.WebsiteUrl,
                submittedByUserId = userId,
                gameIconId = newGame.GameIconId,
                photoUrl = newGame.PhotoUrl,
                keywords = newGame.Keywords,
                };

            var newGameId = db.ExecuteScalar<int>(sqlForNewGame, parametersForGame);

            return newGameId;
        }

    }
}
