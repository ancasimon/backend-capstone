using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class AgeRepository
    {
        static List<Age> ages = new List<Age>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<Age> GetAllAges()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllAges = "select * from Ages";

            var allAges = db.Query<Age>(sqlForAllAges);

            return allAges;
        }
    }
}
