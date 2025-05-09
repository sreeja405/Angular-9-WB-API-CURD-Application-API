import { Injectable } from '@angular/core';  
import { HttpClient ,HttpHeaders} from '@angular/common/http'; 
 import { from, Observable, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

@Injectable()  
export class employeeService {  
    constructor (private httpService: HttpClient) { }  
     
 // Http Options
 httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
} 
    public getEmployeeList() {
       
         let myEmployeeList = this.httpService.get('http://localhost/CRUDAPI/EmployeeList/').pipe(
            map((data: any) => {
                return data;
              }) 
         );  
        return myEmployeeList;  
    }  
    public getDepartmentList() {

        let myDepartmentList = this.httpService.get('http://localhost/CRUDAPI/DepartmentsList/')
        .pipe( map((data: any) => {
            return data;
          }) );

        return myDepartmentList;  
    }  
    public getRecordStatusList() {

        let myRecordStatusList = this.httpService.get('http://localhost/CRUDAPI/RecordStatusList/')
        .pipe( map((data: any) => {
            return data;
          }) );

        return myRecordStatusList;  
    }  

    public DeleteEmployee(dataitem: any) {
    
        const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
        let deleteEmployee =this.httpService.post('http://localhost/CRUDAPI/DeleteEmployee/' + dataitem.EmployeeID,dataitem.EmployeeID, httpOptions);
      
        return deleteEmployee;  
    }

    public saveEmployee(employee: any,isNew: boolean) {
      
      const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
      if(isNew)
      {
         let saveemployee=this.httpService.post('http://localhost/CRUDAPI/AddEmployee',employee,httpOptions)
         .pipe();
            return  saveemployee
        }
        else{
          let saveemployee=this.httpService.post('http://localhost/CRUDAPI/UpdateEmployee',employee,httpOptions)
          .pipe();
             return  saveemployee
        }
                             
    }
}