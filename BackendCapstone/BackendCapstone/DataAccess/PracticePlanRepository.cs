﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class PracticePlanRepository
    {
        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<PracticePlan> GetPracticePlansByUserUid(string uid)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForPracticePlansByUserUid = @"select pp.Id, pp.Name, FORMAT(pp.StartDate, 'd', 'en-us') as startDate, FORMAT(pp.EndDate, 'd', 'en-us') as endDate, pp.IsActive,pp.UserId
                                                from PracticePlans pp
	                                                join Users u
		                                                on pp.UserId = u.Id
                                                where u.FirebaseUid = @uid
                                                AND pp.IsActive = 1";
            var parameterforUserUid = new { uid };

            var userPracticePlans = db.Query<PracticePlan>(sqlForPracticePlansByUserUid, parameterforUserUid);

            return userPracticePlans;
        }

        public PracticePlan GetPracticePlanById(int planId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForSinglePlan = "select Id, Name, FORMAT(StartDate, 'd', 'en-us') as startDate, FORMAT(EndDate, 'd', 'en-us') as endDate, IsActive, UserId from PracticePlans where Id = @planId";
            var parameterForPlanId = new { planId };

            PracticePlan selectedPlan = db.QueryFirstOrDefault<PracticePlan>(sqlForSinglePlan, parameterForPlanId);
            var sqlForPracticeGamesByPlanId = @"select ppg.Name as PracticeName, ppg.Id, pp.Id as PracticePlanId, g.Name as GameName, FORMAT(ppg.PracticeDate, 'd', 'en-us') as PracticeDate, ppg.IsCompleted, ppg.IsActive, ppg.UserNotes
                                                from PracticePlans pp
	                                                join PracticePlanGames ppg
	                                                on pp.Id = ppg.PracticePlanId
		                                                join Games g
		                                                on g.Id = ppg.GameId
                                                where pp.Id = @planId AND pp.IsActive = 1 AND ppg.IsActive = 1";

            var gamesForThisPlan = db.Query<PracticePlanGameWithGameName>(sqlForPracticeGamesByPlanId, parameterForPlanId);

            List<PracticePlanGameWithGameName> gamesList = gamesForThisPlan.ToList();

            selectedPlan.plannedGames.AddRange(gamesList);

            return selectedPlan;
        }
    }
}
