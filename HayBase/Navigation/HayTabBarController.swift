//
//  HayTabBarController.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 15.07.2023.
//

import UIKit

class HayTabBarController: UITabBarController {
    
    // MARK: - Controllers for Tab Bar
  
   
  
    private let mainController: MainViewController = {
//        let productService = ProductService()
        
        let hayService = HayService()
        let mainViewModel = MainViewModel(service: hayService)
        
        let controller = MainViewController(mainViewModel: mainViewModel)
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "h.square", withConfiguration: config)
        
        let tabItem = UITabBarItem(title: nil, image: image, selectedImage: nil)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    
    private let favouriteController: FavouriteViewController = {
        let controller = FavouriteViewController()
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "suit.heart", withConfiguration: config)
        
        let tabItem = UITabBarItem(title: nil, image: image, selectedImage: nil)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    
    
    private let profileController: ProfileViewController = {
        let controller = ProfileViewController()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "person.circle", withConfiguration: config)
        let tabItem = UITabBarItem(title: nil, image: image, selectedImage: nil)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let cartController: CartViewController = {
        let controller = CartViewController()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "bag", withConfiguration: config)
        let tabItem = UITabBarItem(title: nil, image: image, selectedImage: nil)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    // MARK: - Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 90
        tabBar.frame.origin.y = view.frame.height - 90
    }

    // MARK: - Setups
    
    private func setupTabBar() {
        tabBar.tintColor = .systemBrown
        tabBar.backgroundColor = .systemBackground
        tabBar.unselectedItemTintColor = .label
        viewControllers = [mainController, favouriteController, profileController, cartController]
    }

}
