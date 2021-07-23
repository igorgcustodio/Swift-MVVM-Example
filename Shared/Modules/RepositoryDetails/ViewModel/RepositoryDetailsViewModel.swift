//
//  RepositoryDetailsViewModel.swift
//  SwiftRepositories (iOS)
//
//  Created by Igor Custodio on 23/07/21.
//

import Foundation

final class RepositoryDetailsViewModel: RepositoryDetailsViewModelProtocol {
    
    private var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getRepository() -> Repository {
        return repository
    }
}
