//
//  RepositoriesViewController.swift
//  SwiftRepositories
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import UIKit

final class RepositoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repositories: [Repository] = []
    
    private var repositoriesService: RepositoriesServiceProtocol = RepositoriesService()

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
    }
    
    private func applyStyle() {
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

    private func loadData() {
        showProgressHud()
        repositoriesService.getSwiftRepositories { result in
            self.hideProgressHud()
            do {
                guard let result = try result() else { return }
                self.repositories = result
                self.tableView.reloadData()
            } catch {
                let alertError = UIAlertController(title: "Erro", message: "Erro ao carregar a lista de repositorios", preferredStyle: .alert)
                self.present(alertError, animated: true, completion: nil)
            }
        }
    }

}

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(repository: repositories[indexPath.row])
        return cell
    }
    
}
