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
    public class PracticePlanGameWithGameNameRepository
    {

        readonly string _connectionString;
        public PracticePlanGameWithGameNameRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public List<PracticePlanGameWithGameName> GetPracticeGamesByPlanId(int planId)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForPracticeGamesByPlanId = @"select ppg.Name as PracticeName, ppg.Id as Id, g.Name as GameName, FORMAT(ppg.PracticeDate, 'd', 'en-us') as PracticeDate, ppg.IsCompleted, ppg.UserNotes
                                                from PracticePlans pp
	                                                join PracticePlanGames ppg
	                                                on pp.Id = ppg.PracticePlanId
		                                                join Games g
		                                                on g.Id = ppg.GameId
                                                where pp.Id = @planId AND pp.IsActive = 1 AND ppg.IsActive = 1";
            var parameterForPracticePlanId = new { planId };

            var gamesForThisPlan = db.Query<PracticePlanGameWithGameName>(sqlForPracticeGamesByPlanId, parameterForPracticePlanId);

            return gamesForThisPlan.ToList();
        }



    }
}
