//
//  RepositoryDetailsViewController.swift
//  SwiftRepositories
//
//  Created by Torres Conrado, Andre Vinicius on 22/07/21.
//

import Foundation
import UIKit
import AlamofireImage

final class RepositoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelStarsCount: UILabel!
    @IBOutlet weak var imageViewAvatar: UIImageView!
    
    var viewModel: RepositoryDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyles()
        setup()
    }
    
    func setup() {
        guard let repository = viewModel?.getRepository() else { return }
        print(repository.name)
        labelTitle.text = repository.name
        labelDescription.text = repository.description
        labelAuthor.text = repository.owner.login
        labelStarsCount.text = "⭐️ \(repository.stargazersCount.description)"
        imageViewAvatar.af.setImage(withURL: URL(string: repository.owner.avatarUrl)!)
    }

    private func applyStyles() {
        self.title = "Detalhes"
        imageViewAvatar.layer.cornerRadius = imageViewAvatar.frame.size.height/2
    }
    
}
