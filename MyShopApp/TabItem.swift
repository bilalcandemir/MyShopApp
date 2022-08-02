//
//  TabItem.swift
//  MyShopApp
//
//  Created by Bilal Candemir on 8/1/22.
//

import Foundation
import UIKit

enum TabItem:String, CaseIterable {
    case Home = "Home"
    case Category = "Category"
    case Cart = "Cart"
    case Account = "Account"
    
    var viewController:UIViewController{
        switch self {
        case .Home:
            return HomeScreenViewController()
        case .Category:
            return CategoryViewController()
        case .Cart:
            return CartViewController()
        case .Account:
            return AccountViewController()
        }
    }
    
    var icon:UIImage{
        switch self {
        case .Home:
            return UIImage(named: "shopping-cart")!
        case .Category:
            return UIImage(named: "shopping-cart")!
        case .Cart:
            return UIImage(named: "shopping-cart")!
        case .Account:
            return UIImage(named: "shopping-cart")!
        }
    }
    
    var displayTitle: String {
            return self.rawValue.capitalized(with: nil)
        }
}
