using System;
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
    }
}
