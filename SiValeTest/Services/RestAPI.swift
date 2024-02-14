//
//  RestAPI.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import Foundation
import Alamofire

fileprivate let baseURL = "https://6edeayi7ch.execute-api.us-east-1.amazonaws.com/v1"

enum GenericError: Error {
    case noIdea
}

typealias GenericResponse<T> = (Result<T, Error>) -> ()

class RestAPI {
    
    class func getEmployees(_ completion: @escaping GenericResponse<[Employee]>) {
        
        let uri = baseURL + "/examen/employees/:tu_nombre"
        
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        AF.request(uri, method: .get).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<EmployeeDetail, AFError>) in
            
            guard let employeeDetail = response.value,
                  let employeeWrapper = employeeDetail.data,
                  let employees = employeeWrapper.employees
            else {
                completion(.failure(response.error ?? GenericError.noIdea))
                return
            }
            
            completion(.success(employees))
            
        })
        
    }
    
}
