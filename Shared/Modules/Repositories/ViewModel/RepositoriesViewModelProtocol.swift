//
//  RepositoriesViewModelProtocol.swift
//  SwiftRepositories (iOS)
//
//  Created by Igor Custodio on 22/07/21.
//

import UIKit

protocol RepositoriesViewModelProtocol {
    func loadData()
    func goToDetails(viewController: UIViewController, index: Int)
    
    var delegate: RepositoriesViewDelegate? { get set }
    var repositories: [Repository] { get }
}
