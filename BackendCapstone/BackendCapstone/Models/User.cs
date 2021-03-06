﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhotoUrl { get; set; }
        public string FirebaseUid { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsActive { get; set; }
        public string ActiveDate { get; set; }
        public int ImageFileId { get; set; }
    }
}
