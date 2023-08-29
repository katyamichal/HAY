//
//  BasketViewController.swift
//  HayBase
//
//  Created by Katya Michal on 15.07.2023.
//

import UIKit

class BasketViewController: UIViewController {
    
    // MARK: - ViewModel and View
    
    private let basketViewModel: BasketViewModel
    
    private var basketView: BasketView { return self.view as! BasketView }
    // MARK: - Inits

    init(basketViewModel: BasketViewModel) {
        self.basketViewModel = basketViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        basketView.onDeleteProduct = { product in
            self.basketViewModel.deleteProduct(product: product)
        }
        
        
        basketView.onShowOrderView = {
            let orderViewModel = OrderViewModel()
            let orderView = OrderViewController(orderViewModel: orderViewModel)
            self.navigationController?.pushViewController(orderView, animated: true)
        }
        
        basketView.onShowProductDetail = { product in
            
            let productDetailViewModel = ProductDetailViewModel(product: product)
            let productDetailVC = ProductDetailViewController(viewModel: productDetailViewModel)
            
            self.navigationController?.pushViewController(productDetailVC, animated: true)
        }
    }
    
    override func loadView() {
        self.view = BasketView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        loadProducts()
    }
    private func loadProducts() {
        basketViewModel.loadProduct()
        basketView.viewModel = basketViewModel
    }
    
}
