using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class PracticePlanGameRepository
    {
        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public PracticePlanGame GetPracticePlanGameById(int ppgId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToGetPracticePlanGame = "select * from PracticePlanGames where Id = @ppgId";

            var parameterForPpg = new { ppgId };

            var selectedPpg = db.QueryFirstOrDefault<PracticePlanGame>(sqlToGetPracticePlanGame, parameterForPpg);

            return selectedPpg;
        }

        public PracticePlanGame UpdatePracticePlanGame(int ppgId, PracticePlanGame ppgObject)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToUpdatePracticePlanGame = @"UPDATE [dbo].[PracticePlanGames]
                                                SET [Name] = @name
                                                    ,[PracticeDate] = @practiceDate
                                                    ,[UserNotes] = @userNotes
                                                    ,[IsCompleted] = @isCompleted
                                                    ,[IsActive] = @isActive
                                                OUTPUT INSERTED.*
                                                WHERE Id = @ppgId";
            var parameterForPracticePlanGame = new {  
                ppgObject.Name,
                ppgObject.PracticeDate,
                ppgObject.UserNotes,
                ppgObject.IsCompleted,
                ppgObject.IsActive,
                ppgId,
            };

            var updatedPpgObject = db.QueryFirstOrDefault<PracticePlanGame>(sqlToUpdatePracticePlanGame, parameterForPracticePlanGame);

            return updatedPpgObject;
        }

        public int AddPracticePlanGame(PracticePlanGame newPracticePlanGame)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForNewPracticePlanGame = @"INSERT INTO [dbo].[PracticePlanGames]
                                                           ([Name]
                                                           ,[PracticePlanId]
                                                           ,[GameId]
                                                           ,[PracticeDate]
                                                           ,[UserNotes]
                                                           ,[IsCompleted]
                                                           ,[IsActive])
                                                     OUTPUT INSERTED.Id
                                                     VALUES
                                                           (@name, @practicePlanId, @gameId, @practiceDate, @userNotes, @isCompleted, 1)";
            var newId = db.ExecuteScalar<int>(sqlForNewPracticePlanGame, newPracticePlanGame);

            return newId;
            //var sqlToGetPracticePlanGame = "select * from PracticePlanGames where Id = @id";
            //var parameterForPracticePlanGame = new { id = newId };

            //var newPracticePlanGameObject = db.QueryFirstOrDefault<PracticePlanGame>(sqlToGetPracticePlanGame, parameterForPracticePlanGame);

            //return newPracticePlanGameObject;
        }
    }
}
