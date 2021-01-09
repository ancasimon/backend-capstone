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

        public int AddNewGame(int userId, Game newGame)
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
                                                   ,[GamePhotoId]
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
                                                   ,@gamePhotoId
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
                gamePhotoId = newGame.GamePhotoId,
                keywords = newGame.Keywords,
                };

            var newGameId = db.ExecuteScalar<int>(sqlForNewGame, parametersForGame);

            List<int> gameInstruments = new List<int>();
            gameInstruments = newGame.GameInstruments;

            List<int> gameAges = new List<int>();
            gameAges = newGame.GameAges;

            if (newGameId != 0)
            {
                foreach (var item in gameInstruments)
                {
                    var sqlToAddNewGameInstrumentRecord = @"INSERT INTO [dbo].[GameInstruments]
                                                                           ([GameId]
                                                                           ,[InstrumentId])
                                                                     OUTPUT INSERTED.Id
                                                                     VALUES
                                                                           (@gameId
                                                                           ,@instrumentId)";
                    var parametersForNewGameInstrument = new
                    {
                        gameId = newGameId,
                        instrumentId = item,
                    };

                    var newGameInstrumentId = db.ExecuteScalar<int>(sqlToAddNewGameInstrumentRecord, parametersForNewGameInstrument);
                }

                foreach (var item in gameAges)
                {
                    var sqlToAddNewGameAgeRecord = @"INSERT INTO [dbo].[GameAges]
                                                                           ([GameId]
                                                                           ,[AgeId])
                                                                     OUTPUT INSERTED.Id
                                                                     VALUES
                                                                           (@gameId
                                                                           ,@ageId)";
                    var parametersForNewGameAge = new
                    {
                        gameId = newGameId,
                        ageId = item,
                    };

                    var newGameAgeId = db.ExecuteScalar<int>(sqlToAddNewGameAgeRecord, parametersForNewGameAge);
                }
            }

            return newGameId;
        }

        public void RemoveGame(int gameId, int currentUserId)
        {
            using var db = new SqlConnection(_connectionString);

            var parameterForGameToDelete = new { gameId };

            var selectedGameToDelete = GetGameById(gameId);

            if (selectedGameToDelete.SubmittedByUserId == currentUserId)
            {
                // first, delete related gameInstrument records!
                var sqlForInstrumentsForSelectedGame = @"select *
                                                     from GameInstruments gi
                                                    where gi.GameId = @gameId";

                var instrumentsForGame = db.Query<GameInstrument>(sqlForInstrumentsForSelectedGame, parameterForGameToDelete);
                if (instrumentsForGame != null)
                {
                    var sqlToReallyDeleteGameInstrumentRecords = @"DELETE
                                          FROM [dbo].[GameInstruments]
                                          WHERE GameId = @gameId";
                    db.Execute(sqlToReallyDeleteGameInstrumentRecords, parameterForGameToDelete);
                }

                // next, delete related gameAge records:
                var sqlForAgesForSelectedGame = @"select * 
                                              from GameAges ga
                                              where ga.GameId = @gameId";

                var agesForGame = db.Query<GameAge>(sqlForAgesForSelectedGame, parameterForGameToDelete);
                if (agesForGame != null)
                {
                    var sqlToReallyDeleteGameAgeRecords = @"DELETE
                                          FROM [dbo].[GameAges]
                                          WHERE GameId = @gameId";
                    db.Execute(sqlToReallyDeleteGameAgeRecords, parameterForGameToDelete);
                }

                // also delete related file record for photo file:
                var sqlForRelatedFileId = @"select f.Id
                                            from Files f
                                            join Games g
                                            on f.Id = g.GamePhotoId
                                            where g.Id = @gameId";
                var selectedFileId = db.QueryFirst<int>(sqlForRelatedFileId, parameterForGameToDelete);
                if (selectedFileId != null)
                {
                    var sqlToDeleteFile = @"Delete
                                            from Files
                                            where Id = @selectedFileId";
                    var parameterToDeleteFile = new { selectedFileId };
                    db.Execute(sqlToDeleteFile, parameterToDeleteFile);
                }

                var sqlToReallyDeleteGame = @"DELETE
                                          FROM [dbo].[Games]
                                          WHERE Id = @gameId";

                // last, delete the actual game record itself:
                db.Execute(sqlToReallyDeleteGame, parameterForGameToDelete);
            }

        }

        public void UpdateGame(int gameId, GameWithMetadata updatedGame)
        {
            using var db = new SqlConnection(_connectionString);

            var parameterToUpdateGame = new { gameId };

            var selectedGameToUpdate = GetGameById(gameId);

            if (selectedGameToUpdate != null)
            {
                // first, update the data for the game:
                var sqlToUpdateGame = @"UPDATE [dbo].[Games]
                                       SET [Name] = @name
                                          ,[Songs] = @songs
                                          ,[Description] = @description
                                          ,[PreworkLevelId] = @preworkLevelId
                                          ,[Prework] = @prework
                                          ,[Instructions] = @instructions
                                          ,[Credit] = @credit
                                          ,[WebsiteUrl] = @websiteUrl
                                          ,[GameIconId] = @gameIconId
                                          ,[PhotoUrl] = @photoUrl
                                          ,[GamePhotoId] = @gamePhotoId
                                          ,[Keywords] = @keywords
                                     WHERE Id = @gameId";

                var parametersToUpdateGame = new
                {
                    gameId,
                    name = updatedGame.Name,
                    songs = updatedGame.Songs,
                    description = updatedGame.Description,
                    preworkLevelId = updatedGame.PreworkLevelId,
                    prework = updatedGame.Prework,
                    instructions = updatedGame.Instructions,
                    credit = updatedGame.Credit,
                    websiteUrl = updatedGame.WebsiteUrl,
                    gameIconId = updatedGame.GameIconId,
                    photoUrl = updatedGame.PhotoUrl,
                    gamePhotoId = updatedGame.GamePhotoId,
                    keywords = updatedGame.Keywords,
                };
                db.Execute(sqlToUpdateGame, parametersToUpdateGame);

                // next update related gameinstrument records and gameage records if changed:

                //UPDATE GAMEINSTRUMENT and GAMEAGE RECORDS!!!
                // first, check if the instrument IDs selected in the frontend for this game exist for any of the records in the gameInstruments list for this game - if they do, ignore that instrument id:
                var updatedGameInstrumentIds = updatedGame.InstrumentIdsForGame;
                var sqlForInstrumentsForSelectedGame = @"select *
                                                     from GameInstruments gi
                                                    where gi.GameId = @gameId";

                var currentGameInstruments = db.Query<GameInstrument>(sqlForInstrumentsForSelectedGame, parameterToUpdateGame);
                var currentInstrumentIds = new List<int>();
                foreach (var instrument in currentGameInstruments)
                {
                    var id = instrument.InstrumentId;
                    currentInstrumentIds.Add(id);
                }

                if (updatedGameInstrumentIds != null)
                {
                    foreach (var instId in updatedGameInstrumentIds)
                    {
                        if (currentInstrumentIds.Contains(instId))
                        {
                            break;
                        }
                        // if the instrument ID coming in from frontend does not exist in a gameInstrument record for this game, then create a new GI record:
                        if (currentInstrumentIds.IndexOf(instId) == -1)
                        {
                            var sqlToAddNewGameInstrumentRecord = @"INSERT INTO [dbo].[GameInstruments]
                                                                               ([GameId]
                                                                               ,[InstrumentId])
                                                                         OUTPUT INSERTED.Id
                                                                         VALUES
                                                                               (@gameId
                                                                               ,@instrumentId)";
                            var parametersToAddNewGameInstrument = new { gameId, instrumentId = instId };
                            var newGiRecord = db.ExecuteScalar<int>(sqlToAddNewGameInstrumentRecord, parametersToAddNewGameInstrument);
                        }
                    }
                };
                // last, if an instrument ID that already appears in a GI record in the DB for this game but DOES NOT appear in the list of instrument IDs coming in from frontend for this updated game, then delete that GI record:
                foreach (var instId in currentInstrumentIds)
                {
                    if (updatedGameInstrumentIds.IndexOf(instId) == -1)
                    {
                        var sqlToDeleteGameInstrumentRecord = @"DELETE FROM [dbo].[GameInstruments]
                                                                WHERE GameId = @gameId
                                                                AND InstrumentId = @instrumentId";
                        var parametersToDeleteGameInstrument = new { gameId, instrumentId = instId };
                        db.Execute(sqlToDeleteGameInstrumentRecord, parametersToDeleteGameInstrument);
                    }
                }

                // next, do the same thing for gameAge records:
                // first, check if the age IDs selected in the frontend for this game exist for any of the records in the gameAges list for this game - if they do, ignore that age id:
                var updatedGameAgeIds = updatedGame.AgeIdsForGame;
                var sqlForAgesForSelectedGame = @"select *
                                                     from GameAges ga
                                                    where ga.GameId = @gameId";

                var currentGameAges = db.Query<GameAge>(sqlForAgesForSelectedGame, parameterToUpdateGame);
                var currentAgeIds = new List<int>();
                foreach (var age in currentGameAges)
                {
                    var id = age.AgeId;
                    currentAgeIds.Add(id);
                }

                if (updatedGameAgeIds != null)
                {
                    foreach (var ageId in updatedGameAgeIds)
                    {
                        if (currentAgeIds.Contains(ageId))
                        {
                            break;
                        }
                        // if the age ID coming in from frontend does not exist in a gameAge record for this game, then create a new GA record:
                        if (currentAgeIds.IndexOf(ageId) == -1)
                        {
                            var sqlToAddNewGameAgeRecord = @"INSERT INTO [dbo].[GameAges]
                                                                               ([GameId]
                                                                               ,[AgeId])
                                                                         OUTPUT INSERTED.Id
                                                                         VALUES
                                                                               (@gameId
                                                                               ,@ageId)";
                            var parametersToAddNewGameAge = new { gameId, ageId };
                            var newGaRecord = db.ExecuteScalar<int>(sqlToAddNewGameAgeRecord, parametersToAddNewGameAge);
                        }
                    }
                };
                // last, if an age ID that already appears in a GA record in the DB for this game but DOES NOT appear in the list of age IDs coming in from frontend for this updated game, then delete that GA record:
                foreach (var ageId in currentAgeIds)
                {
                    if (updatedGameAgeIds.IndexOf(ageId) == -1)
                    {
                        var sqlToDeleteGameAgeRecord = @"DELETE FROM [dbo].[GameAges]
                                                                WHERE GameId = @gameId
                                                                AND AgeId = @ageId";
                        var parametersToDeleteGameAge = new { gameId, ageId };
                        db.Execute(sqlToDeleteGameAgeRecord, parametersToDeleteGameAge);
                    }
                }
            }


        }
    }
}
