//
//  UIViewController+ProgressHUD.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import Foundation
import SVProgressHUD

extension UIViewController {
    
    func showProgressHud() {
        SVProgressHUD.show()
    }
    
    func hideProgressHud() {
        SVProgressHUD.dismiss()
    }
    
}
