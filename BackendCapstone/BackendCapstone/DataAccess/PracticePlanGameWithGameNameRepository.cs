using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class PracticePlanGameWithGameNameRepository
    {

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<PracticePlanGameWithGameName> GetPracticeGamesByPlanId(int planId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForPracticeGamesByPlanId = @"select ppg.Name as PracticeName, g.Name as GameName, FORMAT(ppg.PracticeDate, 'd', 'en-us') as PracticeDate, ppg.IsCompleted, ppg.UserNotes
                                                from PracticePlans pp
	                                                join PracticePlanGames ppg
	                                                on pp.Id = ppg.PracticePlanId
		                                                join Games g
		                                                on g.Id = ppg.GameId
                                                where pp.Id = @planId AND pp.IsActive = 1 AND ppg.IsActive = 1";
            var parameterForPracticePlanId = new { planId };

            var gamesForThisPlan = db.Query<PracticePlanGameWithGameName>(sqlForPracticeGamesByPlanId, parameterForPracticePlanId);

            return gamesForThisPlan;
        }



    }
}
