//
//  MainModel.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import Foundation

enum CellType: Int {
    case camera
    case listOfEmployees
    case fullName
    case phone
    case birthday
    case gender
    case favoriteColor
    
    func getTitle() -> String {
        switch self {
        case .camera:
            return "Cámara"
        case .listOfEmployees:
            return "Lista de empleados"
        case .fullName:
            return "Nombre completo"
        case .phone:
            return "Número telefónico"
        case .birthday:
            return "Fecha de nacimiento"
        case .gender:
            return "Sexo (Masculino / Femenino)"
        case .favoriteColor:
            return "Color favorito"
        }
    }
    
}

struct MainModel: Equatable {
    
    var cell: CellType
    var isSelected: Bool = false
    
    static let data: [MainModel] = [
        MainModel(cell: CellType.camera),
        MainModel(cell: CellType.listOfEmployees),
        MainModel(cell: CellType.fullName),
        MainModel(cell: CellType.phone),
        MainModel(cell: CellType.birthday),
        MainModel(cell: CellType.gender),
        MainModel(cell: CellType.favoriteColor)
    ]
    
}
