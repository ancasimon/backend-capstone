using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class GameWithMetadataRepository
    {
        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<GameWithMetadata> GetAllActiveGamesWithMetadata()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllGames = @"select g.Id, g.Name, g.Songs, g.Description, pl.Id as PreWorkLevelId, pl.Name as PreworkLevelName, pl.IconUrl as IconUrl,g.Prework,g.Instructions,g.Credit,g.WebsiteUrl, g.PhotoUrl, u.FirstName as UserFirstName, u.LastName as UserLastName,g.DateCreated, gi.Id as GameIconId, gi.IconUrl as GameIconUrl, gi.Html as GameIconHtml, g.PhotoUrl,g.Keywords
                                        from Games g
	                                        join PreworkLevels pl
		                                        on g.PreworkLevelId = pl.Id
			                                        join Users u
				                                        on g.SubmittedByUserId = u.Id
					                                        join GameIcons gi
						                                        on g.GameIconId = gi.Id
                                    where g.IsActive = 1
                                    order by g.Name";

            var allActiveGames = db.Query<GameWithMetadata>(sqlForAllGames);

            // change the result above to a list and do a foreach loop in order to get the related ages and instruments for each game returned here:
            List<GameWithMetadata> activeGamesList = new List<GameWithMetadata>();
            activeGamesList = allActiveGames.ToList();

            foreach (var item in activeGamesList)
            {
                // get the game id first:
                var gameId = item.Id;

                // get all ages for this game:
                var sqlForGameAgesForSelectedGame = @"select a.Id, a.Name,a.IconUrl
                                    from GameAges ga
	                                    join Games g
		                                    on ga.GameId = g.Id
			                                    join Ages a
				                                    on ga.AgeId = a.Id
                                    where GameId = @id";
                var parameterForGameId = new { Id = gameId };
                var selectedGameAges = db.Query<Age>(sqlForGameAgesForSelectedGame, parameterForGameId);
                List<Age> selectedAgesList = selectedGameAges.ToList();

                // assign it to the appropriate property on the game object:
                item.AgesForGame.AddRange(selectedAgesList);

                //get all instruments for this game:
                var sqlForGameInstrumentsForSelectedGame = @"select i.Id, i.Name, i.IconUrl
                                            from GameInstruments gi
	                                            join Instruments i
		                                            on gi.InstrumentId = i.Id
                                            where gi.GameId = @id";
                var selectedGameInstruments = db.Query<Instrument>(sqlForGameInstrumentsForSelectedGame, parameterForGameId);
                List<Instrument> selectedInstrumentsList = selectedGameInstruments.ToList();

                // assign it to the appropriate property on the game object:
                item.InstrumentsForGame.AddRange(selectedInstrumentsList);
            }

            return allActiveGames;
        }

        public GameWithMetadata GetGameByIdWithMetadata(int id)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForSingleGameById = @"select g.Id, g.Name, g.Songs, g.Description, pl.Id as PreWorkLevelId, pl.Name as PreworkLevelName, pl.IconUrl as IconUrl,g.Prework,g.Instructions,g.Credit,g.WebsiteUrl, g.PhotoUrl, u.FirstName as UserFirstName, u.LastName as UserLastName,g.DateCreated, gi.Id as GameIconId, gi.IconUrl as GameIconUrl, g.PhotoUrl,g.Keywords
                                        from Games g
	                                        join PreworkLevels pl
		                                        on g.PreworkLevelId = pl.Id
			                                        join Users u
				                                        on g.SubmittedByUserId = u.Id
					                                        join GameIcons gi
						                                        on g.GameIconId = gi.Id
                                        where g.Id =@id";
            var parameterForGameId = new { Id = id };

            var selectedGame = db.QueryFirstOrDefault<GameWithMetadata>(sqlForSingleGameById, parameterForGameId);

            //next we query for the ages for this game:
            var sqlForAgesForGame = @"select a.Id, a.Name,a.IconUrl
                                    from GameAges ga
	                                    join Games g
		                                    on ga.GameId = g.Id
			                                    join Ages a
				                                    on ga.AgeId = a.Id
                                    where GameId = @id";
            var agesForGame = db.Query<Age>(sqlForAgesForGame, parameterForGameId);
            List<Age> agesList = new List<Age>();
            agesList = agesForGame.ToList();
            selectedGame.AgesForGame = agesList;

            // and next get all the instruments for this game:
            var sqlForInstrumentsForGame = @"select i.Id, i.Name, i.IconUrl
                                            from GameInstruments gi
	                                            join Instruments i
		                                            on gi.InstrumentId = i.Id
                                            where gi.GameId = @id";
            var instrumentsForGame = db.Query<Instrument>(sqlForInstrumentsForGame, parameterForGameId);
            List<Instrument> instrumentsList = new List<Instrument>();
            instrumentsList = instrumentsForGame.ToList();
            selectedGame.InstrumentsForGame = instrumentsList;

            return selectedGame;
        }
    }
}
