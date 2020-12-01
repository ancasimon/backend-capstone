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
    [Route("api/instruments")]
    [ApiController]
    public class InstrumentsController : ControllerBase
    {
        InstrumentRepository _instrumentRepo;

        public InstrumentsController()
        {
            _instrumentRepo = new InstrumentRepository();
        }

        [HttpGet]
        public IActionResult GetInstrumentValues()
        {
            var allInstruments = _instrumentRepo.GetAllInstruments();

            return Ok(allInstruments);
        }
    }
}
