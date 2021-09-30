//
//  SystemError.swift
//  promotionsApp
//
//  Created by Иван Миронов on 03.05.2021.
//

import Foundation

enum SystemError: LocalizedError {
    case requestProblem
    case mapping
    
    var errorDescription: String? {
        switch self {
        case .requestProblem:
            return "Request Problem"
        case .mapping:
            return "Mapping Error"
        }
    }
}
