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
    public class UsersController : FirebaseEnabledController
    {
        UserRepository _userRepo;

        public UsersController()
        {
            _userRepo = new UserRepository();
        }

        [HttpGet]
        public IActionResult GetAllActiveUsers()
        {
            var allActiveUsers = _userRepo.GetAllActiveUsers();

            return Ok(allActiveUsers);
        }

        [HttpGet("{uid}")]
        public IActionResult GetUserIdByUid(string uid)
        {
            var currentUserId = _userRepo.GetUserIdByUid(uid);

            return Ok(currentUserId);
        }

        [HttpPost]
        public IActionResult CreateUser(User user)
        {
            _userRepo.AddUser(user);

            return Created($"/api/users/{user.Id}", user);
        }
    }
}
