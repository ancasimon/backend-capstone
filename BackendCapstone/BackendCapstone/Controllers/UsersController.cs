using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using BackendCapstone.DataAccess;
using Microsoft.AspNetCore.Authorization;

namespace BackendCapstone.Controllers
{
    [Route("api/users")]
    [ApiController]
    [Authorize]
    public class UsersController : FirebaseEnabledController
    {
        UserRepository _userRepo;

        public UsersController(UserRepository repo)
        {
            _userRepo = repo;
        }

        [HttpGet]
        public IActionResult GetAllActiveUsers()
        {
            var allActiveUsers = _userRepo.GetAllActiveUsers();

            return Ok(allActiveUsers);
        }

        [HttpGet("email/{email}")]
        [AllowAnonymous]
        public IActionResult CheckIfEmailIsValid(string email)
        {
            var existingEmail = _userRepo.CheckUserEmail(email);

            return Ok(existingEmail);
        }

        [HttpGet("{uid}")]
        public IActionResult GetUserIdByUid(string uid)
        {
            var currentUserId = _userRepo.GetUserIdByUid(uid);

            return Ok(currentUserId);
        }

        [HttpGet("user")]
        public IActionResult GetUserByUid()
        {
            var currentUser = _userRepo.GetUserByUid(UserId);

            return Ok(currentUser);
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult CreateUser(User user)
        {
            _userRepo.AddUser(user);

            return Created($"/api/users/{user.Id}", user);
        }
    }
}
