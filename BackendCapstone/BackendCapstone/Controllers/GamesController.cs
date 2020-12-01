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
    [Route("api/games")]
    [ApiController]
    public class GamesController : ControllerBase
    {
        GameRepository _gameRepo;

        public GamesController()
        {
            _gameRepo = new GameRepository();
        }

        [HttpGet]
        public IActionResult GetAllActiveGames()
        {
            var allActiveGames = _gameRepo.GetAllActiveGames();

            return Ok(allActiveGames);
        }
    }
}
