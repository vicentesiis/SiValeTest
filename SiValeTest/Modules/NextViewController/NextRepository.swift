//
//  NextRepository.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import Foundation

protocol NextRepositoryProtocol: AnyObject {
    func getEmployees(completion: @escaping GenericResponse<[Employee]>)
}

class NextRepository: NextRepositoryProtocol {
    
    func getEmployees(completion: @escaping GenericResponse<[Employee]>) {
        RestAPI.getEmployees { response in
            switch response {
            case .success(let employees):
                completion(.success(employees))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
