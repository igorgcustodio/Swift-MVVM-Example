//
//  RepositoriesViewController.swift
//  SwiftRepositories
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import UIKit

final class RepositoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var viewModel: RepositoriesViewModelProtocol = RepositoriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyStyle()
        loadData()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: RepositoryTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        viewModel.delegate = self
        
    }
    
    private func applyStyle() {
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        self.title = "Repositories"
        self.navigationItem.backButtonTitle = ""
    }

    private func loadData() {
        viewModel.loadData()
    }
}

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(repository: viewModel.repositories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetails(viewController: self, index: indexPath.row)
    }
}

extension RepositoriesViewController: RepositoriesViewDelegate {
    func dataLoaded() {
        tableView.reloadData()
    }
    
    func showAlertError(title: String, message: String) {
        let alertError = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alertError, animated: true, completion: nil)
    }
    
    func showLoading() {
        showProgressHud()
    }
    
    func hideLoading() {
        hideProgressHud()
    }
    
    
}
