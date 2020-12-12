using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;


namespace BackendCapstone.DataAccess
{
    public class UserRatingRepository
    {
        readonly string _connectionString;
        public UserRatingRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }
    }
}
