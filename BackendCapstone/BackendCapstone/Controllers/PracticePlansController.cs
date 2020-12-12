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
    [Authorize]
    public class PracticePlansController : FirebaseEnabledController
    {
        PracticePlanRepository _practicePlanRepo;
        UserRepository _userRepo;

        public PracticePlansController(PracticePlanRepository repo1, UserRepository repo2)
        {
            _practicePlanRepo = repo1;
            _userRepo = repo2;
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
            if (selectedPracticePlan == null) return NotFound("we did not find a practice plan with this ID.");
            return Ok(selectedPracticePlan);
        }

        [HttpPut("{planId}")]
        public IActionResult UpdatePracticePlan(int planId, PracticePlan updatedPPObject)
        {
            var currentUserId = _userRepo.GetUserIdByUid(UserId);
            var updatedPracticePlan = _practicePlanRepo.UpdatePracticePlan(planId, updatedPPObject, currentUserId);
            return Ok(updatedPracticePlan);
        }

        [HttpPost]
        public IActionResult AddPracticePlan(PracticePlan newPracticePlan)
        {
            var currentUserId = _userRepo.GetUserIdByUid(UserId);
            var newPracticePlanObject = _practicePlanRepo.AddPracticePlan(currentUserId, newPracticePlan);

            return Created($"/api/practiceplans/{newPracticePlan.Id}", newPracticePlanObject);
        }

    }
}
