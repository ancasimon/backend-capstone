using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class PreworkLevelRepository
    {
        static List<PreworkLevel> preworkLevels = new List<PreworkLevel>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public List<PreworkLevel> GetAllPreworkLevels()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForAllPreworkLevels = "select * from PreworkLevels";

            var allPreworkLevels = db.Query<PreworkLevel>(sqlForAllPreworkLevels);

            List<PreworkLevel> preworkLevelsList = new List<PreworkLevel>();

            preworkLevelsList = allPreworkLevels.ToList();

            return preworkLevelsList;
        }
    }
}
