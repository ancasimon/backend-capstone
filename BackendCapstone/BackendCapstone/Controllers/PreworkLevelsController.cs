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
    [Route("api/preworkLevels")]
    [ApiController]
    public class PreworkLevelsController : ControllerBase
    {
        PreworkLevelRepository _preworkLevelRepo;

        public PreworkLevelsController(PreworkLevelRepository repo)
        {
            _preworkLevelRepo = repo;
        }

        [HttpGet]
        public IActionResult GetPreworkLevelsValues()
        {
            var allPreworkLevels = _preworkLevelRepo.GetAllPreworkLevels();

            return Ok(allPreworkLevels);
        }
    }
}
