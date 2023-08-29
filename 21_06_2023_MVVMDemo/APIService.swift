//
//  APIService.swift
//  21_06_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 29/08/23.
//

import Foundation
class APIService : NSObject{
    private let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
    func getAllEmployeeData(completion : @escaping(Employee)->()){
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data{
                let jsonDecoder = JSONDecoder()
                let employeeData = try! jsonDecoder.decode(Employee.self, from: data)
                completion(employeeData)
            }
        }.resume()
    }
}
