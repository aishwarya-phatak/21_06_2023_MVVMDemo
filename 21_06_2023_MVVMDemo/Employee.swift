//
//  Employee.swift
//  21_06_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 28/08/23.
//

import Foundation
struct Employee : Decodable{
    var status : String
    var data : [EmployeeData]
}

struct EmployeeData : Decodable{
    let id, employeeName,employeeSalary,
        employeeAge : String
    let profileImage : String
    
    enum CodingKeys : String,CodingKey{
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
