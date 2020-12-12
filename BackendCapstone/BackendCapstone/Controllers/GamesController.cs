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
        GameWithMetadataRepository _gameWithDataRepo;

        public GamesController(GameRepository repo1, GameWithMetadataRepository repo2)
        {
            _gameRepo = repo1;
            _gameWithDataRepo = repo2;
        }

        // Changed method below to call the method for the game with metadata instead of the regular game record:
        [HttpGet]
        public IActionResult GetAllActiveGames()
        {
            var allActiveGames = _gameWithDataRepo.GetAllActiveGamesWithMetadata();

            return Ok(allActiveGames);
        }


        // Changed method below to call the method for the game with metadata instead of the regular game record:
        [HttpGet("{id}")]
        public IActionResult GetGameById(int id)
        {
            if (_gameRepo.GetGameById(id) == null) return NoContent();

            var selectedGame = _gameWithDataRepo.GetGameByIdWithMetadata(id);

            return Ok(selectedGame);
        }
    }
}
