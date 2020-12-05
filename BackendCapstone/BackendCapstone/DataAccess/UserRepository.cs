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

        public IEnumerable<User> GetAllActiveUsers()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllUsers = "select * from Users where IsActive = 1";

            var allActiveUsers = db.Query<User>(sqlForAllUsers);

            return allActiveUsers;
        }

        public void AddUser(User newUser)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToAddNewUser = @"INSERT INTO [dbo].[Users]
                                               ([IsActive]
                                               ,[FirebaseUid]
                                               ,[Email]
                                               ,[Password]
                                               ,[FirstName]
                                               ,[LastName]
                                               ,[PhotoUrl]
                                               ,[DateCreated])
                                         OUTPUT INSERTED.*
                                         VALUES
                                               (1
                                               ,@firebaseUid
                                               ,@email
                                               ,@password
                                               ,@firstName
                                               ,@lastName
                                               ,@photoUrl
                                               ,GETDATE())";

            var newId = db.ExecuteScalar<int>(sqlToAddNewUser, newUser);

            newUser.Id = newId;
        }
    }
}
