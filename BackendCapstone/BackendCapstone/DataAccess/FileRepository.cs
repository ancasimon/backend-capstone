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

        public UploadedFile Add(UploadedFile file, int userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Insert into Files(FileName,FileContent,FileContentType,FileLength)
                        Output inserted.id
                        values (@FileName,@FileContent,@FileContentType,@FileLength)";
            
            int newFileId = db.ExecuteScalar<int>(sql, file);
            var sqlToUpdateUserRecord = @"Update Users
                                          Set ImageFileId = @imageFileId
                                          Where Id = @userId";
            var parametersToUpdateUserRecord = new { imageFileId = newFileId, userId };
            db.Execute(sqlToUpdateUserRecord, parametersToUpdateUserRecord);
            
            return GetById(newFileId);
        }

        // overloading the Add method - using only one parameter:
        public UploadedFile Add(UploadedFile uploadedPhoto)
        {
            using var db = new SqlConnection(_connectionString);

            var sqlToUploadNewGamePhoto = @"INSERT INTO [dbo].[GamePhotos]
                                                       ([FileName]
                                                       ,[FileContent]
                                                       ,[FileContentType]
                                                       ,[FileLength])
                                                 Output inserted.id
                                                 VALUES
                                                       (@fileName
                                                       ,@fileContent
                                                       ,@fileContentType
                                                       ,@fileLength)";
            int newGamePhotoId = db.ExecuteScalar<int>(sqlToUploadNewGamePhoto, uploadedPhoto);

            var sqlToUpdateGameRecord = "Update Games Set GamePhotoId = @gamePhotoId Where Id = @gameId";
            var parametersToUpdateGameRecord = new { gamePhotoId = newGamePhotoId };
            db.Execute(sqlToUpdateGameRecord, parametersToUpdateGameRecord);

            return GetById(newGamePhotoId);
        }

        public UploadedFile GetById(int fileId)
        {
            var sql = @"Select * From Files Where Id = @fileId";

            using (var db = new SqlConnection(_connectionString))
            {
                return db.QueryFirstOrDefault<UploadedFile>(sql, new { fileId = fileId });
            }

        }

    }
}
