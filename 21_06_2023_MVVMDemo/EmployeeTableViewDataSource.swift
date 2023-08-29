//
//  EmployeeTableViewDataSource.swift
//  21_06_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 29/08/23.
//

import Foundation
import UIKit

class EmployeeTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource{
    
    private var cellIdentifier : String!
    private var items :  [T]!
    var configurecell : (CELL, T)->() = {_,_ in}
    
    init(cellIdentifier :String, items : [T], configurecell : @escaping((CELL,T)->())){
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configurecell = configurecell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configurecell(cell,item)
        return cell
    }
}
