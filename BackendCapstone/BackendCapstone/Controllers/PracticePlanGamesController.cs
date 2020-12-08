using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackendCapstone.DataAccess;
using BackendCapstone.Models;

namespace BackendCapstone.Controllers
{
    [Route("api/practiceplangames")]
    [ApiController]
    public class PracticePlanGamesController : ControllerBase
    {
        PracticePlanGameRepository _practicePlanGameRepo;

        public PracticePlanGamesController()
        {
            _practicePlanGameRepo = new PracticePlanGameRepository();
        }

        [HttpGet("{id}")]
        public IActionResult GetPracticePlanGameById(int id)
        {
            var selectedPpgObject = _practicePlanGameRepo.GetPracticePlanGameById(id);

            return Ok(selectedPpgObject);
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
