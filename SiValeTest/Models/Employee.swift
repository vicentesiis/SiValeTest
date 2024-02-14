//
//  Employee.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import Foundation

struct EmployeeDetail: Decodable {
    let success: Bool
    let data: EmployeesWrapper?
}

struct EmployeesWrapper: Decodable {
    let employees: [Employee]?
}

struct Employee: Decodable {
    
    let id: Int?
    let name: String?
    let lastName: String?
    let birthday: Int?
    
}
