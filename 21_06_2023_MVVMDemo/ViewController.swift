//
//  ViewController.swift
//  21_06_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 28/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var employeeTableView: UITableView!
    private var employeeViewModel : EmployeeViewModel!
    private dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>
    
    override func viewDidLoad() {
        super.viewDidLoad()
       callToViewModelForUpdating()
    }
    
    func callToViewModelForUpdating(){
        self.employeeViewModel = EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        self.dataSource = EmployeeTableViewDataSource(
            cellIdentifier: "EmployeeTableViewCell",
            items: self.employeeViewModel.empData.data,
            configurecell: { cell, empModel in
                cell.empLabel1.text = empModel.id
                cell.empLabel2.text = empModel.employeeAge
            })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
}
