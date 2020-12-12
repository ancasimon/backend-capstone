using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;


namespace BackendCapstone.DataAccess
{
    public class UserReviewRepository
    {
        readonly string _connectionString;
        public UserReviewRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }
    }
}
