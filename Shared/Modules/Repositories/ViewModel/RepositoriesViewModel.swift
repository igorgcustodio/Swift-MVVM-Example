//
//  RepositoriesViewModel.swift
//  SwiftRepositories (iOS)
//
//  Created by Igor Custodio on 22/07/21.
//

import UIKit

final class RepositoriesViewModel: RepositoriesViewModelProtocol {
    
    private var repositoriesService: RepositoriesServiceProtocol
    var repositories: [Repository] = [] {
        didSet {
            self.delegate?.dataLoaded()
        }
    }
    var delegate: RepositoriesViewDelegate?
    
    init() {
        repositoriesService = RepositoriesService()
    }
    
    func loadData() {
        delegate?.showLoading()
        repositoriesService.getSwiftRepositories { result in
            self.delegate?.hideLoading()
            
            do {
                guard let result = try result() else { return }
                self.repositories = result
            } catch {
                self.delegate?.showAlertError(title: "Erro", message: "Erro ao carregar a lista de repositórios")
            }
        }
    }
    
    func goToDetails(viewController: UIViewController, index: Int) {
        let detailsVC = RepositoryDetailsViewController.instantiate(repository: self.repositories[index])
        viewController.show(detailsVC, sender: self)
    }
}
