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
    public class UserRepository
    {
        readonly string _connectionString;
        public UserRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

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

        public User GetUserByUid(string uid)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlForUserRecordByUid = @"  select u.Id, u.FirstName, u.LastName, u.Email, u.PhotoUrl, (select format (u.DateCreated, 'MMM dd yyyy')) as ActiveDate
                                          from Users u
                                          where FirebaseUid = @uid";

            var parameterForUid = new { uid = uid };

            var selectedUser = db.QueryFirstOrDefault<User>(sqlForUserRecordByUid, parameterForUid);

            return selectedUser;
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
