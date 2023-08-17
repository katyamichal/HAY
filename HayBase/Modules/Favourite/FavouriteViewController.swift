//
//  FavouriteViewController.swift
//  HayBase
//
//  Created by Katya Michal on 15.07.2023.
//

import UIKit

final class FavouriteViewController: UIViewController {
  
    
  
    // MARK: - ViewModel and View
    
    private let favouriteViewModel: FavouriteViewModel
    
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
        favouriteView.collectionView.delegate = self
        
        loadProducts()
        
        favouriteView.onLocalProductDidChanged = { product in
            self.favouriteViewModel.update(product: product)
        }
        
        favouriteViewModel.onUpdateModel = {
            self.favouriteView.viewModel = self.favouriteViewModel
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        loadProducts()
    }
    
    
    // MARK: - Methods

    private func loadProducts() {
        favouriteViewModel.loadProduct()
        favouriteView.update(viewModel: favouriteViewModel)
    }
}

extension FavouriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = favouriteViewModel.products?[indexPath.item] else {return}
        let viewModel = ProductDetailViewModel(product: product)
        
        let singleProductDetailVC = ProductDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(singleProductDetailVC, animated: true)
    }
}
