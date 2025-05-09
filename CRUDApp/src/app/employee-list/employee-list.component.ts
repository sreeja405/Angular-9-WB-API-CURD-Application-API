import { Component, OnInit,ChangeDetectorRef  } from '@angular/core';
import { employeeService } from '../services/employee.service'; 
//import { process, State } from '@progress/kendo-data-query';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { GridDataResult, DataStateChangeEvent } from '@progress/kendo-angular-grid';  
import { ToastrService } from 'ngx-toastr';
const createFormGroup = dataItem => new FormGroup({
    'EmployeeID': new FormControl(dataItem.EmployeeID),
    'EmployeeName': new FormControl(dataItem.EmployeeName,  Validators.compose([Validators.required, Validators.pattern('^[a-zA-Z0-9_ -]+$')])),
    'DepartmentID': new FormControl(dataItem.DepartmentID, Validators.required),
    'RecordStatusID': new FormControl(dataItem.RecordStatusID, Validators.required),
});

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css'],
  providers:[employeeService] 
})
export class EmployeeListComponent implements OnInit {
  
  public view: Observable<GridDataResult>;
  public formGroup: FormGroup;
  private editedRowIndex: number;
  public gridData: GridDataResult;
  constructor(private service: employeeService , private cdr: ChangeDetectorRef,private toastr: ToastrService) { }
  arrEmployee :any[];arrDepartment : any[] ;
 
  arrRecordStatus:any[];
  public selectedDepartment: { DepartmentName: string, DepartmentID: number};
  ngOnInit() { 
    this.getEmployees();
    this.getDepartments();
    this.getRecordStatus();
  }
  getEmployees(){
    
    let employeelist=this.service.getEmployeeList().
    subscribe(employees => {this.arrEmployee = employees
      this.cdr.detectChanges(); 
    });
  
  }
  getDepartments(){
    let departmentlist=this.service.getDepartmentList().
    subscribe( 
      departments => { this.arrDepartment = departments 
     } );
   
  }
  getRecordStatus(){
    
    let recordstatuslist=this.service.getRecordStatusList().
    subscribe(recordstatus => this.arrRecordStatus = recordstatus);

  }
//   public department(id: number): any {
    
//     let dep=this.arrDepartment.find(x => x.DepartmentID === id); 
//     return dep; 
//   }
// public recordstatus(id: number): any {
  
//   let rec= this.arrRecordStatus.find(x => x.RecordStatusID === id);
//   return rec; 
// }
  public addHandler({ sender }) {
    this.closeEditor(sender);

    this.formGroup = createFormGroup({
        'EmployeeID':0,
        'EmployeeName': '',
        'DepartmentID': 0, 
        'DepartmentName':'',
        'RecordStatusID': 1,
        'RecordStatusName':''
    });
 
    sender.addRow(this.formGroup);
}

public editHandler({ sender, rowIndex, dataItem }) {
    this.closeEditor(sender);

    this.formGroup = createFormGroup(dataItem);

    this.editedRowIndex = rowIndex; 
    sender.editRow(rowIndex, this.formGroup);
}

public cancelHandler({ sender, rowIndex }) {
    this.closeEditor(sender, rowIndex);
}

public saveHandler({ sender, rowIndex, formGroup, isNew }): void {
  
  const employee = formGroup.value;

    this.service.saveEmployee(employee,isNew).subscribe(() => {
      if(isNew)
      this.toastr.success("Employee Added Successfully.","Notification",{positionClass:"top-full-width"}) ; 
      else
      this.toastr.success("Employee Details updated Successfully.","Notification") ;
    });
    sender.closeRow(rowIndex); 
     
    setTimeout( () => {this.getEmployees();},300);  
  }
 

public removeHandler({ dataItem }){
  if (confirm("Are you sure you want to delete this ?")) { 
    this.service.DeleteEmployee(dataItem).subscribe(() => {
      this.getEmployees();
      this.toastr.info("Employee Deacivated Successfully.","Notification",{positionClass:"toast-top-left"}) ;
    });
    setTimeout( () => {this.getEmployees();},300);
  }
}

private closeEditor(grid, rowIndex = this.editedRowIndex) {
    grid.closeRow(rowIndex);
    this.editedRowIndex = undefined;
    this.formGroup = undefined;
}
  

}
