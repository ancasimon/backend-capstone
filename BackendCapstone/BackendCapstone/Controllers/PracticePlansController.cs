using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace BackendCapstone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PracticePlansController : ControllerBase
    {
    }
}
