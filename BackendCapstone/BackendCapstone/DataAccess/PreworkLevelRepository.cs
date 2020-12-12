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
    public class PreworkLevelRepository
    {
        readonly string _connectionString;
        public PreworkLevelRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public IEnumerable<PreworkLevel> GetAllPreworkLevels()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForAllPreworkLevels = "select * from PreworkLevels";

            var allPreworkLevels = db.Query<PreworkLevel>(sqlForAllPreworkLevels);

            return allPreworkLevels;
        }
    }
}
