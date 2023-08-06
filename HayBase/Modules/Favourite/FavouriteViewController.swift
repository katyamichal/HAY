//
//  FavouriteViewController.swift
//  HayBase
//
//  Created by Katya Michal on 15.07.2023.
//

import UIKit

final class FavouriteViewController: UIViewController, FavouriteViewDelegate {
    func updateViewModel(with product: LocalProduct) {
        favouriteViewModel.update(with: product)
    }
    
  
    // MARK: - ViewModel and View

    private let favouriteViewModel: FavouriteViewModel
    /// if viewModel has beed changed, controller sends view
    
    private var favouriteView: FavouriteView { return self.view as! FavouriteView }
    
    
    // MARK: - Inits

    init(favouriteViewModel: FavouriteViewModel) {
        self.favouriteViewModel = favouriteViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Cycle
    
    override func loadView() {
        self.view = FavouriteView()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadProducts()
    }
    
    
    // MARK: - Methods

    private func loadProducts() {
        favouriteViewModel.loadProduct()
        favouriteView.update(viewModel: favouriteViewModel)
    }
}
