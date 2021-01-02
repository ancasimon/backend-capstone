using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.DataAccess;
using BackendCapstone.Models;
using Microsoft.AspNetCore.Authorization;

namespace BackendCapstone.Controllers
{
    [Route("api/practiceplangames")]
    [ApiController]
    [Authorize]
    public class PracticePlanGamesController : ControllerBase
    {
        PracticePlanGameRepository _practicePlanGameRepo;
        PracticePlanGameWithGameNameRepository _practicePlanGameWithDataRepo;

        public PracticePlanGamesController(PracticePlanGameRepository repo, PracticePlanGameWithGameNameRepository practicePlanGameWithDataRepo)
        {
            _practicePlanGameRepo = repo;
            _practicePlanGameWithDataRepo = practicePlanGameWithDataRepo;
        }

        [HttpGet("{id}")]
        public IActionResult GetPracticePlanGameById(int id)
        {
            var selectedPpgObject = _practicePlanGameRepo.GetPracticePlanGameById(id);

            return Ok(selectedPpgObject);
        }

        [HttpGet("plan/{planId}")]
        public IActionResult GetPracticePlanGamesForPracticePlanId(int planId)
        {
            var currentPPGames = _practicePlanGameWithDataRepo.GetPracticeGamesByPlanId(planId);
            return Ok(currentPPGames);
        }


        [HttpPut("{id}")]
        public IActionResult UpdatePracticePlanGameRecord(int id, PracticePlanGame ppgObject)
        {
            var updatedPpgObject = _practicePlanGameRepo.UpdatePracticePlanGame(id, ppgObject);

            return Ok(updatedPpgObject);
        }

        [HttpPost]
        public IActionResult AddPracticePlanGame(PracticePlanGame newPracticePlanGame)
        {
            var newPracticePlanObject = _practicePlanGameRepo.AddPracticePlanGame(newPracticePlanGame);

            return Created($"/api/practiceplangames/{newPracticePlanGame.Id}", newPracticePlanObject);
        }
    }
}
