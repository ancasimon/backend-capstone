using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.Models;
using BackendCapstone.DataAccess;

namespace BackendCapstone.Controllers
{
    [Route("api/gameIcons")]
    [ApiController]
    public class GameIconsController : ControllerBase
    {
        GameIconRepository _gameIconRepo;

        public GameIconsController(GameIconRepository repo)
        {
            _gameIconRepo = repo;
        }

        [HttpGet]
        public IActionResult GetGameIconValues()
        {
            var allGameIcons = _gameIconRepo.GetAllGameIcons();

            return Ok(allGameIcons);
        }

    }
}
