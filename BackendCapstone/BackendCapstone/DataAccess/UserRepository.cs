using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace BackendCapstone.DataAccess
{
    public class UserRepository
    {
        static List<User> users = new List<User>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public List<User> GetAllActiveUsers()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllUsers = "select * from Users where IsActive = 1";

            var allActiveUsers = db.Query<User>(sqlForAllUsers);

            List<User> usersActiveList = new List<User>();
            usersActiveList = allActiveUsers.ToList();

            return usersActiveList;
        }
    }
}
