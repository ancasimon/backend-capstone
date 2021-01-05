using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendCapstone.Models
{
    public class UploadedFile
    {
        public byte[] FileContent { get; set; }

        public long FileLength { get; set; }

        public string FileContentType { get; set; }

        public string FileName { get; set; }
    }
}
