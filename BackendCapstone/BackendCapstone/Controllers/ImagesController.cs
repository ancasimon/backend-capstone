using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.DataAccess;
using BackendCapstone.Helpers;

namespace BackendCapstone.Controllers
{
    [Route("api/images")]
    [ApiController]
    public class ImagesController : FirebaseEnabledController
    {
        readonly FileRepository _repo;
        UserRepository _userRepo;

        public ImagesController(FileRepository repo, UserRepository userRepo)
        {
            _repo = repo;
            _userRepo = userRepo;
        }

        [HttpPost]
        public IActionResult UploadFile()
        {
            var fileUploadHelper = new FileUploadHelper();
            var file = fileUploadHelper.GetFileUploadContent(Request.ContentType, Request.Body);
            var currentUserId = _userRepo.GetUserIdByUid(UserId);

            _repo.Add(file, currentUserId);

            return Ok();
        }

        //api/images/123
        [HttpGet("{id}")]
        public IActionResult GetFile(int id)
        {
            var uploadedFile = _repo.GetById(id);

            return File(uploadedFile.FileContent, uploadedFile.FileContentType);
        }
    }
}
