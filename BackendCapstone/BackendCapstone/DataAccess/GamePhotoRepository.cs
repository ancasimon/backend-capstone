//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Threading.Tasks;
//using Dapper;
//using Microsoft.Data.SqlClient;
//using Microsoft.Extensions.Configuration;
//using BackendCapstone.Helpers;
//using BackendCapstone.Models;

//namespace BackendCapstone.DataAccess
//{
//    public class GamePhotoRepository
//    {
//        string _connectionString;
//        public GamePhotoRepository(IConfiguration configuration)
//        {
//            _connectionString = configuration.GetConnectionString("BackendCapstone");
//        }

//        public UploadedFile Add(UploadedFile uploadedPhoto)
//        {
//            using var db = new SqlConnection(_connectionString);

//            var sqlToUploadNewGamePhoto = @"INSERT INTO [dbo].[GamePhotos]
//                                                       ([FileName]
//                                                       ,[FileContent]
//                                                       ,[FileContentType]
//                                                       ,[FileLength])
//                                                 Output inserted.id
//                                                 VALUES
//                                                       (@fileName
//                                                       ,@fileContent
//                                                       ,@fileContentType
//                                                       ,@fileLength)";
//            int newGamePhotoId = db.ExecuteScalar<int>(sqlToUploadNewGamePhoto, uploadedPhoto);

//            var sqlToUpdateGameRecord = "Update Games Set GamePhotoId = @gamePhotoId Where Id = @gameId";
//            var parametersToUpdateGameRecord = new { gamePhotoId = newGamePhotoId, gameId = uploadedPhoto.gameId };
//            db.Execute(sqlToUpdateGameRecord, parametersToUpdateGameRecord);

//            return GetById(newGamePhotoId);
//        }

//        public UploadedGamePhoto GetById(int gamePhotoId)
//        {
//            using var db = new SqlConnection(_connectionString);

//            var sqlToGetSingleGamePhoto = "Select * from GamePhotos where Id = @gamePhotoId";
//            var parameterToGetGamePhoto = new { gamePhotoId };

//            return db.QueryFirstOrDefault<UploadedGamePhoto>(sqlToGetSingleGamePhoto, parameterToGetGamePhoto)
//        }
//    }
//}
