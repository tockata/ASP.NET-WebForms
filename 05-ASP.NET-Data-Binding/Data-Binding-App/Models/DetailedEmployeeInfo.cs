namespace Data_Binding_App.Models
{
    using System;

    public class DetailedEmployeeInfo
    {
        public byte[] Photo { get; set; }

        public string Phone { get; set; }

        public DateTime? HireDate { get; set; }

        public string Address { get; set; }

        public string Notes { get; set; }
    }
}