//
//  RepositoriesViewDelegate.swift
//  SwiftRepositories (iOS)
//
//  Created by Igor Custodio on 23/07/21.
//

import Foundation

protocol RepositoriesViewDelegate {
    func dataLoaded(with repositories: [Repository])
    func showLoading()
    func hideLoading()
    func showAlertError(title: String, message: String)
}
