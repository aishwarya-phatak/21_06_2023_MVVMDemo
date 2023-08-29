//
//  EmployeeViewModel.swift
//  21_06_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 29/08/23.
//

import Foundation
class EmployeeViewModel : NSObject{
    private var apiService : APIService!
    private (set) var empData : Employee!{
        didSet{
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (()->()) = {}

    override init(){
        super.init()
        self.apiService = APIService()      //instance of APISevice is created
        getEmployeeData()
    }
    
    func getEmployeeData(){
        self.apiService.getAllEmployeeData { (employeeData) in
            self.empData = employeeData
        }
    }
}
