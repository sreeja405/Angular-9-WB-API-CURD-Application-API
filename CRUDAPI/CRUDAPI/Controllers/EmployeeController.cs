using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CRUDAPI.Models;

namespace CRUDAPI.Controllers
{
    public class EmployeeController : ApiController
    {
        WebApiDbEntities objEntity = new WebApiDbEntities();

        [HttpGet]
        //[ActionName("EmployeeList")]
        [Route("EmployeeList")]
        public IEnumerable<EmployeeDetails> GetEmployees()
        {
            List<EmployeeDetails> employeeDetails = new List<EmployeeDetails>();
            try
            { 
                employeeDetails = (from a in objEntity.viewEmployeeDetails
                           
                            select new EmployeeDetails
                            {
                                 
                                EmployeeID = a.EmployeeID,
                                EmployeeName = a.EmployeeName,
                                DepartmentID = a.DepartmentID,
                                RecordStatusID = a.RecordStatusID,
                                DepartmentName=a.DepartmentName,
                                RecordStatusName=a.RecordStatusName
                            }

                           ).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return employeeDetails.AsEnumerable();
        }
        
         
        [HttpPost]
        [Route("AddEmployee")]
        public IHttpActionResult AddEmployee(Employee data)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            try
            {
                objEntity.Employees.Add(data);
                objEntity.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            } 
            return Ok(data);
        }

        [HttpPost]
        [Route("UpdateEmployee")]
        public IHttpActionResult UpdateEmployee(Employee employee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                // objEntity.Entry(employee).State = System.Data.Entity.EntityState.Modified;
                Employee objEmp = new Employee();
                objEmp = objEntity.Employees.Find(employee.EmployeeID);
                if (objEmp != null)
                {
                    objEmp.EmployeeName = employee.EmployeeName;
                    objEmp.DepartmentID = employee.DepartmentID;
                    objEmp.RecordStatusID = employee.RecordStatusID;


                }
                int i = this.objEntity.SaveChanges();

            }
            catch (Exception)
            {
                throw;
            }
            return Ok(employee);
        }
        [HttpPost] 
        [Route("DeleteEmployee/{id}")]
        public IHttpActionResult DeleteEmployee(int id)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            Employee objEmp = new Employee();
            try
            {
                // objEntity.Entry(employee).State = System.Data.Entity.EntityState.Modified;
               
                objEmp = objEntity.Employees.Find(id);
                
                if (objEmp != null)
                { 
                    objEmp.RecordStatusID = 2;
                    int i = this.objEntity.SaveChanges();// objEntity.SaveChanges();

                }
                else
                {
                    return NotFound();
                } 

            }
            catch (Exception)
            {
                throw;
            }
            return Ok(objEmp.EmployeeName);
           
        }

        [HttpGet]
        [Route("DepartmentsList")]
        public IEnumerable<Departments> GetDepartments()
        {
            List<Departments> department = new List<Departments>();
            try
            {
                department = (from a in objEntity.Departments

                                   select new Departments
                                   { 
                                       DepartmentID = a.DepartmentID, 
                                       DepartmentName = a.DepartmentName,
                                   }

                           ).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return department.AsEnumerable();
        }

        [HttpGet]
        [Route("RecordStatusList")]
        public IEnumerable<RecordStatus> GetRecordStatus()
        {
            List<RecordStatus> recordStatus = new List<RecordStatus>();
            try
            {
                recordStatus = (from a in objEntity.RecordStatus

                              select new RecordStatus
                              {
                                  RecordStatusID = a.RecordStatusID,
                                  RecordStatusName = a.RecordStatusName,
                              }

                           ).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return recordStatus.AsEnumerable();
        }
    }
}
