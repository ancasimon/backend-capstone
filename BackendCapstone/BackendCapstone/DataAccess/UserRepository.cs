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

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<User> GetAllActiveUsers()
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForAllUsers = "select * from Users where IsActive = 1";

            var allActiveUsers = db.Query<User>(sqlForAllUsers);

            return allActiveUsers;
        }

        public int GetUserIdByUid(string uid)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForUserRecordByUid = "select * from Users where FirebaseUid = @uid";

            var parameterForUid = new { uid = uid };

            var selectedUserId = db.ExecuteScalar<int>(sqlForUserRecordByUid, parameterForUid);

            return selectedUserId;
        }

        public User AddUser(User newUser)
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

            var newUserRecord = db.QueryFirstOrDefault<User>(sqlToAddNewUser, newUser);

            return newUserRecord;
        }
    }
}
