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
    [Route("api/ages")]
    [ApiController]
    public class AgesController : ControllerBase
    {
        AgeRepository _ageRepo;

        public AgesController(AgeRepository repo)
        {
            _ageRepo = repo;
        }

        [HttpGet]
        public IActionResult GetAgeValues()
        {
            var allAges = _ageRepo.GetAllAges();

            return Ok(allAges);
        }
    }
}
