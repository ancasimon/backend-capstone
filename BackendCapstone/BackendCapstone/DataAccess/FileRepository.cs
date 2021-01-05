using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using BackendCapstone.Helpers;
using BackendCapstone.Models;

namespace BackendCapstone.DataAccess
{
    public class FileRepository
    {
        string _connectionString;
        public FileRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendCapstone");

        }

        public UploadedFile Add(UploadedFile file)
        {
            var sql = @"Insert into Files(FileName,FileContent,FileContentType,FileLength)
                        Output inserted.id
                        values (@FileName,@FileContent,@FileContentType,@FileLength)";
            int newFileId;
            using (var db = new SqlConnection(_connectionString))
            {
                newFileId = db.ExecuteScalar<int>(sql, file);
            }
            return GetById(newFileId);
        }

        public UploadedFile GetById(int fileId)
        {
            var sql = @"Select * From Files Where Id = @fileId";

            using (var db = new SqlConnection(_connectionString))
            {
                return db.QueryFirst<UploadedFile>(sql, new { fileId = fileId });
            }

        }

    }
}
