//
//  CommonErrors.swift
//  SwiftRepositories
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import Foundation

class CommonNetworkError : Error, LocalizedError {
    public var errorDescription: String? {
        return "Internet não encontrada"
    }
}
