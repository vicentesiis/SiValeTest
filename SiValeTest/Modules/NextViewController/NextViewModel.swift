//
//  NextViewModel.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import Foundation
import UIKit

protocol NextViewModelProtocol: AnyObject {
    var employees: Dynamic<[Employee]?> { get }
}

class NextViewModel: NextViewModelProtocol {
    
    var items: [MainModel]!
    var employees: Dynamic<[Employee]?>
    
    var gender: [String] {
        return ["Masculino", "Femenino"]
    }
    
    var colors: [UIColor] {
        return [.black, .green, .blue, .yellow, .brown]
    }
    
    private let repository: NextRepository!
    
    init(repository: NextRepository!, items: [MainModel]) {
        self.repository = repository
        self.items = items
        self.employees = Dynamic(nil)
    }
    
    func getEmployees() {
        repository.getEmployees { [weak self] response in
            switch response {
            case .success(let employees):
                self?.employees.value = employees
            case .failure(let error):
                // Handle Error
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Fast way to get procceded data
    
    func getEmployeeId(_ index: Int) -> String {
        return "ID: \(employees.value?[index].id ?? .zero)"
    }
    
    func getEmployeeName(_ index: Int) -> String {
        return "Nombre: \(employees.value?[index].name ?? "")"
    }
    
    func getEmployeeLastName(_ index: Int) -> String {
        return "Last Nombre: \(employees.value?[index].lastName ?? "")"
    }
    
    func getEmployeeBithday(_ index: Int) -> String {
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateStyle = .short

        let birthdayDate = Date(timeIntervalSince1970: TimeInterval(employees.value?[index].birthday ?? .zero))
        let dateString = dayTimePeriodFormatter.string(from: birthdayDate)
        return "Fecha de cumpleaños: \(dateString)"
        
    }
    
    
}
