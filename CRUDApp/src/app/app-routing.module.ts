import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
//import { EmployeeListComponent } from './employee-list/employee-list.component';

 const routes: Routes = [];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
// export const AppRoutingModule: Routes = [
//   {

//               path: "EmployeeList",
//               component:EmployeeListComponent ,
//               data: {
//                   title: "EmployeeList",
//                   urls: [{ title: "EmployeeList", url: "./employee-list/employee-list.component" }]
//               }
//   }
// ];



// export class AppRoutingModule {   
//     path: "EmployeeList",
//     component: EmployeeListComponent,
//     children: [
//       { path: "EmployeeList", loadChildren: "./employee-list/employee-list.component" }
//     ]
  
// }
