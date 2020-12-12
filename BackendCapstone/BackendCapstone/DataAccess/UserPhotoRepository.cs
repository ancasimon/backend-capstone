using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;


namespace BackendCapstone.DataAccess
{
    public class UserPhotoRepository
    {
        readonly string _connectionString;
        public UserPhotoRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }
    }
}
