using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using BackendCapstone.Models;
using Microsoft.Extensions.Configuration;

namespace BackendCapstone.DataAccess
{
    public class InstrumentRepository
    {
        readonly string _connectionString;
        public InstrumentRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");
        }

        public IEnumerable<Instrument> GetAllInstruments()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForAllInstruments = "select * from Instruments";

            var allInstruments = db.Query<Instrument>(sqlForAllInstruments);

            return allInstruments;
        }
    }
}
