using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class GameIconRepository
    {
        static List<GameIcon> gameIcons = new List<GameIcon>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public List<GameIcon> GetAllGameIcons()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForAllGameIcons = "select * from GameIcons";

            var allGameIcons = db.Query<GameIcon>(sqlForAllGameIcons);
            List<GameIcon> gameIconsList = new List<GameIcon>();

            gameIconsList = allGameIcons.ToList();

            return gameIconsList;
        }
    }
}
