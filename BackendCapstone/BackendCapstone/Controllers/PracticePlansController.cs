using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using BackendCapstone.DataAccess;
using BackendCapstone.Models;


namespace BackendCapstone.Controllers
{
    [Route("api/practiceplans")]
    [ApiController]
    //[Authorize]
    public class PracticePlansController : FirebaseEnabledController
    {
        PracticePlanRepository _practicePlanRepo;

        public PracticePlansController()
        {
            _practicePlanRepo = new PracticePlanRepository();
        }

        [HttpGet]
        public IActionResult GetPracticePlansByUserUid()
        {
            var userActivePracticePlans = _practicePlanRepo.GetPracticePlansByUserUid(UserId);
            return Ok(userActivePracticePlans);
        }

        [HttpGet("{planId}")]
        public IActionResult GetSinglePracticePlanById(int planId)
        {
            var selectedPracticePlan = _practicePlanRepo.GetPracticePlanById(planId);
            return Ok(selectedPracticePlan);
        }

    }
}
