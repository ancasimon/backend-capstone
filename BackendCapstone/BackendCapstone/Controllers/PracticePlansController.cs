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
        UserRepository _userRepo;

        public PracticePlansController()
        {
            _practicePlanRepo = new PracticePlanRepository();
            _userRepo = new UserRepository();
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

        [HttpPut("{planId}")]
        public IActionResult UpdatePracticePlan(int planId, PracticePlan updatedPPObject)
        {
            var updatedPracticePlan = _practicePlanRepo.UpdatePracticePlan(planId, updatedPPObject);
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
