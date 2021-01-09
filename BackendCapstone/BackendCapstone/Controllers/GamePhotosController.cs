//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Threading.Tasks;
//using BackendCapstone.DataAccess;
//using BackendCapstone.Helpers;

//namespace BackendCapstone.Controllers
//{
//    [Route("api/gamePhotos")]
//    [ApiController]
//    public class GamePhotosController : ControllerBase
//    {
//        readonly GamePhotoRepository _gamePhotoRepo;
//        GameRepository _gameRepo;

//        public GamePhotosController
//            (GamePhotoRepository gamePhotoRepo)
//        {
//            _gamePhotoRepo = gamePhotoRepo;
//        }

//        [HttpPost]
//        public IActionResult UploadGamePhoto()
//        {
//            var fileUploadHelper = new FileUploadHelper();
//            var file = fileUploadHelper.GetFileUploadContent(Request.ContentType, Request.Body);

//            _gamePhotoRepo.Add(file);

//            return Ok();
//        }

//        [HttpGet("{id}")]
//        public IActionResult GetGamePhoto(int gamePhotoId)
//        {
//            var uploadedGamePhoto = _gamePhotoRepo.GetById(gamePhotoId);
//            if (uploadedGamePhoto == null)
//            {
//                return NotFound();
//            }
//            return File(uploadedGamePhoto.FileContent, uploadedGamePhoto.FileContentType);
//        }
//    }
//}
