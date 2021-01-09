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
    public class GameWithMetadataRepository
    {
        readonly string _connectionString;
        public GameWithMetadataRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public GameWithMetadataRepository()
        {
        }


        // Moving code block from the GetFilteredList ... method below to its own method:
        public List<int> EnsureValidFilterValuesAge(List<int> selectedAges)
        {
            var anyAges = selectedAges.Any();

            // updating the parameters passed in to include all values if the user didn't select any specific ones on the frontend:
            if (anyAges == false)
            {
                selectedAges = new List<int>() { 1, 2, 3, 4, 5 };
            }

            return selectedAges;
        }

        public List<int> EnsureValidFilterValuesInstrument(List<int> selectedInstruments)
        {
            var anyInstruments = selectedInstruments.Any();

            // updating the parameters passed in to include all values if the user didn't select any specific ones on the frontend:

            if (anyInstruments == false)
            {
                selectedInstruments = new List<int>() { 1, 2, 3, 4, 5, 6, 7 };
            }

            return selectedInstruments;
        }

        public List<int> EnsureValidFilterValuesPreworkLevel(List<int> selectedPreworkLevels)
        {
            var anyPreworkLevels = selectedPreworkLevels.Any();

            // updating the parameters passed in to include all values if the user didn't select any specific ones on the frontend:
            if (anyPreworkLevels == false)
            {
                selectedPreworkLevels = new List<int>() { 1, 2, 3, 4 };
            }

            return selectedPreworkLevels;
        }


        //Adding a new method to get all these games but filtered based on the age, instrument and prework level filters the user selects. 
        public IEnumerable<GameWithMetadata> GetFilteredListOfGamesWithMetadata(string searchInput, List<int> selectedAges, List<int> selectedInstruments, List<int> selectedPreworkLevels)
       {
            using var db = new SqlConnection(_connectionString);

            selectedAges = EnsureValidFilterValuesAge(selectedAges);
            selectedInstruments = EnsureValidFilterValuesInstrument(selectedInstruments);
            selectedPreworkLevels = EnsureValidFilterValuesPreworkLevel(selectedPreworkLevels);

            var sqlForFilteredListOfGames = @"select g.Id, g.Name, g.Songs, g.Description, g.IsActive, pl.Id as PreWorkLevelId, pl.Name as PreworkLevelName, pl.IconUrl as IconUrl,g.Prework,g.Instructions,g.Credit,g.WebsiteUrl, g.PhotoUrl, g.GamePhotoId, g.SubmittedByUserId, u.FirstName as UserFirstName, u.LastName as UserLastName, g.DateCreated, gi.Id as GameIconId, gi.IconUrl as GameIconUrl, gi.Html as GameIconHtml, g.PhotoUrl,g.Keywords
                                            from Games g
	                                        join PreworkLevels pl
		                                        on g.PreworkLevelId = pl.Id
			                                        join Users u
				                                        on g.SubmittedByUserId = u.Id
					                                        join GameIcons gi
						                                        on g.GameIconId = gi.Id
                                                                    join GameAges ga
	                                                                    on g.Id = ga.GameId
		                                                                    join GameInstruments ginst
		                                                                       on g.Id = ginst.GameId
                                    where g.IsActive = 1
                                    AND g.PreworkLevelId In @selectedPreworkLevels
                                    AND ga.AgeId IN @selectedAges
                                    AND ginst.InstrumentId IN @selectedInstruments
                                    AND g.Keywords like '%' + @searchInput + '%'
                                    group by g.Name, g.Id, g.IsActive, g.Songs, g.Description, g.PreworkLevelId, pl.Id, pl.Name, pl.IconUrl, g.Prework, g.Instructions, g.Credit, g.WebsiteUrl,g.SubmittedByUserId, u.FirstName, u.LastName, g.DateCreated, g.GameIconId, g.PhotoUrl, g.Keywords, gi.Id, gi.IconUrl, gi.Html
                                    order by g.Name";
            var parametersForFilters = new { selectedAges, selectedInstruments, selectedPreworkLevels, searchInput = (searchInput ?? "") };
            var filteredGames = db.Query<GameWithMetadata>(sqlForFilteredListOfGames, parametersForFilters);

            // change the result above to a list and do a foreach loop in order to get the related ages and instruments for each game returned here:
            List <GameWithMetadata> filteredGamesList = new List<GameWithMetadata>();
            filteredGamesList = filteredGames.ToList();

            foreach (var item in filteredGamesList)
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

            return filteredGames;
        }
        public IEnumerable<GameWithMetadata> GetAllActiveGamesWithMetadata()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllGames = @"select g.Id, g.Name, g.Songs, g.Description, pl.Id as PreWorkLevelId, pl.Name as PreworkLevelName, pl.IconUrl as IconUrl,g.Prework,g.Instructions,g.Credit,g.WebsiteUrl, g.PhotoUrl, g.GamePhotoId, u.FirstName as UserFirstName, u.LastName as UserLastName,g.DateCreated, gi.Id as GameIconId, gi.IconUrl as GameIconUrl, gi.Html as GameIconHtml, g.PhotoUrl,g.Keywords
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

            var sqlForSingleGameById = @"select g.Id, g.Name, g.Songs, g.Description, pl.Id as PreWorkLevelId, pl.Name as PreworkLevelName, pl.IconUrl as IconUrl,g.Prework,g.Instructions,g.Credit,g.WebsiteUrl, g.PhotoUrl, g.GamePhotoId, g.SubmittedByUserId, u.FirstName as UserFirstName, u.LastName as UserLastName, u.PhotoUrl as UserPhotoUrl, u.ImageFileId, g.DateCreated, gi.Id as GameIconId, gi.IconUrl as GameIconUrl, g.PhotoUrl,g.Keywords
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

            //need to also get just the IDs for the edit form > so that we can correctly display the preselected options:
            var sqlForAgeIdsForGame = @"select a.Id
                                    from GameAges ga
	                                    join Games g
		                                    on ga.GameId = g.Id
			                                    join Ages a
				                                    on ga.AgeId = a.Id
                                    where GameId = @id";
            var ageIdsForGame = db.Query<int>(sqlForAgeIdsForGame, parameterForGameId);
            List<int> ageIdsList = new List<int>();
            ageIdsList = ageIdsForGame.ToList();
            selectedGame.AgeIdsForGame = ageIdsList;

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

            //need to also get just the IDs for the edit form > so that we can correctly display the preselected options:
            var sqlForInstrumentIdsForGame = @"select i.Id
                                            from GameInstruments gi
	                                            join Instruments i
		                                            on gi.InstrumentId = i.Id
                                            where gi.GameId = @id";
            var instrumentIdsForGame = db.Query<int>(sqlForInstrumentIdsForGame, parameterForGameId);
            List<int> instrumentIdsList = new List<int>();
            instrumentIdsList = instrumentIdsForGame.ToList();
            selectedGame.InstrumentIdsForGame = instrumentIdsList;

            // to allow users to delete a game, we need to make sure there are no practice plan games using it first:
            var sqlForPracticePlanGamesForSelectedGame = @"select * from PracticePlanGames
                                                           where GameId = @id";
            var associatedPracticePlanGames = db.Query<PracticePlanGame>(sqlForPracticePlanGamesForSelectedGame, parameterForGameId);
            selectedGame.HasAssociatedPracticePlanGames = associatedPracticePlanGames.Any();

            return selectedGame;
        }

        // method to get all games submitted by the authenticated user:
        public List<GameWithMetadata> GetGamesForAuthedUser(string uid)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForGamesFromAuthedUser = @"select g.Id, g.Name, g.IsActive, g.Keywords
                                            from Games g
                                                join Users u
                                                    on g.SubmittedByUserId = u.Id
                                            where u.FirebaseUid = @uid
                                            order by g.Id desc";
            var parameterForUid = new { uid };
            var userContributedGames = db.Query<GameWithMetadata>(sqlForGamesFromAuthedUser, parameterForUid);
            var gamesList = userContributedGames.ToList();

            return gamesList;
        }
    }
}
