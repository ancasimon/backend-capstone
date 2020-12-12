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
    public class AgeRepository
    {
        readonly string _connectionString;
        public AgeRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public IEnumerable<Age> GetAllAges()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllAges = "select * from Ages";

            var allAges = db.Query<Age>(sqlForAllAges);

            return allAges;
        }
    }
}
