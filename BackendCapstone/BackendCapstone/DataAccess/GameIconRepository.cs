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
    public class GameIconRepository
    {
        readonly string _connectionString;
        public GameIconRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public IEnumerable<GameIcon> GetAllGameIcons()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForAllGameIcons = "select * from GameIcons order by Name";

            var allGameIcons = db.Query<GameIcon>(sqlForAllGameIcons);

            return allGameIcons;
        }
    }
}
