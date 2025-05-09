using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDAPI.Models
{
    public class EmployeeDetails
    {   
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public int RecordStatusID { get; set; }
        public string DepartmentName { get; set; }
        public string RecordStatusName { get; set; }

    }
    public class Departments
    {
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; }
    }
    public class RecordStatus
    {
        public int RecordStatusID { get; set; }
        public string RecordStatusName { get; set; }
    }
}