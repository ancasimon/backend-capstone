﻿using Microsoft.AspNetCore.Http;
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
    [Route("api/games")]
    [ApiController]
    public class GamesController : FirebaseEnabledController
    {
        GameRepository _gameRepo;
        GameWithMetadataRepository _gameWithDataRepo;
        UserRepository _userRepo;

        public GamesController(GameRepository repo1, GameWithMetadataRepository repo2, UserRepository userRepo)
        {
            _gameRepo = repo1;
            _gameWithDataRepo = repo2;
            _userRepo = userRepo;
        }

        // Changed method below to call the method for the game with metadata instead of the regular game record:
        [HttpGet("all")]
        public IActionResult GetAllActiveGames()
        {
            var allActiveGames = _gameWithDataRepo.GetAllActiveGamesWithMetadata();

            return Ok(allActiveGames);
        }

        //new method to get all games filtered by user-selected ages, instruments, and prework levels:
        [HttpGet()]
        public IActionResult GetFilteredGames([FromQuery] string searchInput, [FromQuery] List<int> selectedAges, [FromQuery] List<int> selectedInstruments, [FromQuery] List<int> selectedPreworkLevels)
        {
            var filteredGames = _gameWithDataRepo.GetFilteredListOfGamesWithMetadata(searchInput, selectedAges, selectedInstruments, selectedPreworkLevels);

            return Ok(filteredGames);
        }


        // Changed method below to call the method for the game with metadata instead of the regular game record:
        [HttpGet("{id}")]
        public IActionResult GetGameById(int id)
        {
            if (_gameRepo.GetGameById(id) == null) return NoContent();

            var selectedGame = _gameWithDataRepo.GetGameByIdWithMetadata(id);

            return Ok(selectedGame);
        }

        // Method to get games submitted by the user who is logged in
        [HttpGet("submittedby")]
        public IActionResult GetGamesSubmittedByAuthedUser()
        {
            var userContributions = _gameWithDataRepo.GetGamesForAuthedUser(UserId);

            return Ok(userContributions);
        }

        [HttpGet("latest")]
        public IActionResult GetLatestGames()
        {
            var latestGames = _gameRepo.GetLatestGames();

            return Ok(latestGames);
        }

        [HttpGet("popular")]
        public IActionResult GetMostPopularGames()
        {
            var mostPopularGames = _gameRepo.GetMostPopularGames();

            return Ok(mostPopularGames);
        }

        [HttpPost]
        [Authorize]
        public IActionResult PostNewGame(Game gameToAdd)
        {
            var currentUserId = _userRepo.GetUserIdByUid(UserId);
            var newGameId = _gameRepo.AddNewGame(currentUserId, gameToAdd);

            return Ok(newGameId);
        }

        [HttpDelete("{gameId}")]
        [Authorize]
        public IActionResult DeleteGame(int gameId)
        {
            var currentUserId = _userRepo.GetUserIdByUid(UserId);

            if (_gameRepo.GetGameById(gameId) == null)
            {
                return NotFound();
            }

            _gameRepo.RemoveGame(gameId, currentUserId);

            return Ok();
        }

        [HttpPut("{gameId}")]
        [Authorize]
        public IActionResult UpdateGame(int gameId, GameWithMetadata updatedGame)
        {
            var currentUserId = _userRepo.GetUserIdByUid(UserId);

            if (_gameRepo.GetGameById(gameId) == null)
            {
                return NotFound();
            }

            _gameRepo.UpdateGame(gameId, updatedGame);

            return Ok();
        }
    }
}
