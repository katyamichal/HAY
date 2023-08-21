//
//  HayTabBarController.swift
//  HayBase
//
//  Created by Katya Michal on 15.07.2023.
//

import UIKit

class HayTabBarController: UITabBarController {
    
    // MARK: - Controllers for Tab Bar
  
    
    lazy var nav1 = UINavigationController(rootViewController: mainController)

    lazy var nav2 = UINavigationController(rootViewController: favouriteController)
    
//    let nav3 = UINavigationController(rootViewController: )
//    let nav4 = UINavigationController(rootViewController: )
  
    private lazy var mainController: MainViewController = {
        
        let hayService = HayService()
        let mainViewModel = MainViewModel(service: hayService)
        
        let controller = MainViewController(mainViewModel: mainViewModel)
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "h.square", withConfiguration: config)
        
        let tabItem = UITabBarItem(title: nil, image: image, selectedImage: nil)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    
    private lazy var favouriteController: FavouriteViewController = {
        
        let favouriteService = FavouriteService()
        
        let favouriteViewModel = FavouriteViewModel(favouriteService: favouriteService)
        
        let controller = FavouriteViewController(favouriteViewModel: favouriteViewModel)
        
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
    
    private let cartController: BasketViewController = {
        
        let cartService = CartService()
        let viewModel = BasketViewModel(cartService: cartService)
        
        let controller = BasketViewController(basketViewModel: viewModel)
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
        viewControllers = [nav1, nav2, profileController, cartController]
    }

}
