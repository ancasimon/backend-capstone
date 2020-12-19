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
    public class PracticePlanRepository
    {
        readonly string _connectionString;
        public PracticePlanRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public IEnumerable<PracticePlan> GetPracticePlansByUserUid(string uid)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForPracticePlansByUserUid = @"select pp.Id as PlanId, pp.Name, FORMAT(pp.StartDate, 'd', 'en-us') as startDate, FORMAT(pp.EndDate, 'd', 'en-us') as endDate, pp.IsActive,pp.UserId as UserId
                                                from PracticePlans pp
	                                                join Users u
		                                                on pp.UserId = u.Id
                                                where u.FirebaseUid = @uid
                                                AND pp.IsActive = 1
                                                order by StartDate desc";
            var parameterforUserUid = new { uid };

            var userPracticePlans = db.Query<PracticePlan>(sqlForPracticePlansByUserUid, parameterforUserUid);

            return userPracticePlans;
        }

        public PracticePlan GetPracticePlanById(int planId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForSinglePlan = "select Id as PlanId, Name, FORMAT(StartDate, 'd', 'en-us') as startDate, FORMAT(EndDate, 'd', 'en-us') as endDate, IsActive, UserId from PracticePlans where Id = @planId";
            var parameterForPlanId = new { planId };

            PracticePlan selectedPlan = db.QueryFirstOrDefault<PracticePlan>(sqlForSinglePlan, parameterForPlanId);
            if (selectedPlan != null)
            {
                var sqlForPracticeGamesByPlanId = @"select ppg.Name as PracticeName, ppg.Id, pp.Id as PracticePlanId, g.Name as GameName, FORMAT(ppg.PracticeDate, 'd', 'en-us') as PracticeDate, ppg.IsCompleted, ppg.IsActive, ppg.UserNotes
                                                from PracticePlans pp
	                                                join PracticePlanGames ppg
	                                                on pp.Id = ppg.PracticePlanId
		                                                join Games g
		                                                on g.Id = ppg.GameId
                                                where pp.Id = @planId AND pp.IsActive = 1 AND ppg.IsActive = 1
                                                order by PracticeDate desc";

                var gamesForThisPlan = db.Query<PracticePlanGameWithGameName>(sqlForPracticeGamesByPlanId, parameterForPlanId);

                List<PracticePlanGameWithGameName> gamesList = gamesForThisPlan.ToList();

                selectedPlan.plannedGames.AddRange(gamesList);
            }

            return selectedPlan;
        }

        public PracticePlan UpdatePracticePlan(int planId, PracticePlan updatedPpObject, int userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToUpdatePracticePlan = @"UPDATE [dbo].[PracticePlans]
                                           SET [Name] = @name
                                              ,[UserId] = @userId
                                              ,[StartDate] = @startDate
                                              ,[EndDate] = @endDate
                                              ,[IsActive] = @isActive
                                         OUTPUT INSERTED.*
                                         WHERE Id = @planId";
            var parametersForUpdatedPracticePlan = new
            {
                updatedPpObject.Name,
                userId,
                updatedPpObject.StartDate,
                updatedPpObject.EndDate,
                updatedPpObject.IsActive,
                planId,
            };

            var updatedPracticePlan = db.QueryFirstOrDefault<PracticePlan>(sqlToUpdatePracticePlan, parametersForUpdatedPracticePlan);

            return updatedPracticePlan;
        }

        public PracticePlan InactivatePlan(int planId)
        {
            using var db = new SqlConnection(_connectionString);

            var parametersForPlan = new { planId };

            var sqlToInactivatePlan = @"UPDATE [dbo].[PracticePlans]
                                        SET [IsActive] = 0
                                        OUTPUT INSERTED.*
                                        WHERE Id = @planId";
            var inactivatedPlan = db.QueryFirstOrDefault<PracticePlan>(sqlToInactivatePlan, parametersForPlan);

            var sqlToFindRelatedGames = "select * from PracticePlanGames where PracticePlanId = @planId";
            var anyRelatedGames = db.Query<PracticePlanGame>(sqlToFindRelatedGames, parametersForPlan);

            if (anyRelatedGames != null)
            {
                var sqlToInactivateRelatedGames = @"UPDATE PracticePlanGames
                                                    SET IsActive = 0
                                                    OUTPUT INSERTED.*
                                                    WHERE PracticePlanId = @planId";
                var inactivatedGames = db.Query<PracticePlanGame>(sqlToInactivateRelatedGames, parametersForPlan);
            }

            return inactivatedPlan;
        }

        public int AddPracticePlan(int id, PracticePlan newPracticePlan)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToAddNewPracticePlan = @"INSERT INTO [dbo].[PracticePlans]
                                                       ([Name]
                                                       ,[UserId]
                                                       ,[StartDate]
                                                       ,[EndDate]
                                                       ,[IsActive])
                                                 OUTPUT INSERTED.Id
                                                 VALUES
                                                       (@name
                                                       ,@userId
                                                       ,@startDate
                                                       ,@endDate
                                                       ,1)";
            var parametersForNewPracticePlan = new { name = newPracticePlan.Name, userId = id, startDate = newPracticePlan.StartDate, endDate = newPracticePlan.EndDate };
            var newId = db.ExecuteScalar<int>(sqlToAddNewPracticePlan, parametersForNewPracticePlan);

            return newId;
        }

        // added a new method that returns the new object created:
        public PracticePlan AddPracticePlanAndReturnFullObject(int id, PracticePlan newPracticePlan)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToAddNewPracticePlan = @"INSERT INTO [dbo].[PracticePlans]
                                                       ([Name]
                                                       ,[UserId]
                                                       ,[StartDate]
                                                       ,[EndDate]
                                                       ,[IsActive])
                                                 OUTPUT INSERTED.Id
                                                 VALUES
                                                       (@name
                                                       ,@userId
                                                       ,@startDate
                                                       ,@endDate
                                                       ,1)";
            var parametersForNewPracticePlan = new { name = newPracticePlan.Name, userId = id, startDate = newPracticePlan.StartDate, endDate = newPracticePlan.EndDate };
            var newPracticePlanObject = db.QueryFirstOrDefault<PracticePlan>(sqlToAddNewPracticePlan, parametersForNewPracticePlan);

            return newPracticePlanObject;
        }
    }
}
