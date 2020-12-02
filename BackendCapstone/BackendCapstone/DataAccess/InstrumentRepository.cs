using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using BackendCapstone.Models;

namespace BackendCapstone.DataAccess
{
    public class InstrumentRepository
    {
        static List<Instrument> instruments = new List<Instrument>();

        const string _connectionString = "Server=localhost;Database=BackendCapstone;Trusted_Connection=True";

        public IEnumerable<Instrument> GetAllInstruments()
        {
            using var db = new SqlConnection(_connectionString);
            var sqlForAllInstruments = "select * from Instruments";

            var allInstruments = db.Query<Instrument>(sqlForAllInstruments);

            return allInstruments;
        }
    }
}
