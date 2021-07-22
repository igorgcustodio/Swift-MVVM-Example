//
//  RepositoriesService.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import Foundation
import Alamofire

typealias RepositoriesCallback = (() throws -> [Repository]?) -> Void

protocol RepositoriesServiceProtocol {

    func getSwiftRepositories(_ completion: @escaping RepositoriesCallback)

}

final class RepositoriesService: RepositoriesServiceProtocol {
    
    var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("Falha ao ler url base, implement BASE_URL key on info.plist and add in project settings")
        }
        return url
    }

    private enum API: String {
        case searchSwiftRepositories = "/search/repositories?q=language:swift&sort=stars&page=1"
    }
    
    func getSwiftRepositories(_ completion: @escaping RepositoriesCallback) {
        let urlEndPoint = baseURL + API.searchSwiftRepositories.rawValue
        print("endPoint: \(urlEndPoint)")
        AF.request(urlEndPoint)
            .validate()
            .responseDecodable(of: RepositoriesDecodable.self) { (response) in
                switch response.result {
                case .success( _ ):
                    guard let response = response.value else { return }
                    completion { response.repositories }
                case .failure(let error):
                    completion { throw error }
                }
        }
    }

}
