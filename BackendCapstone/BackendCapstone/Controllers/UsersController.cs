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
    public class UsersController : ControllerBase
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
    }
}
