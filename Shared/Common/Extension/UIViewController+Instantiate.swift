//
//  UIViewController+Instantiate.swift
//  SwiftRepositories (iOS)
//
//  Created by Igor Custodio on 23/07/21.
//

import UIKit

public enum FlowType {
    case navigation
    case push
    case modal
    case overContent
    
}

extension UIViewController {
    @objc public class func instantiate() -> Self {
        func instantiateFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            let t = T.init(nibName: String(describing: T.self), bundle: Bundle.init(for: T.self))
            t.modalPresentationStyle = .fullScreen
            return t
        }
        
        return instantiateFromNib(self)
    }
}
