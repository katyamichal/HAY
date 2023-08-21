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
    }
    
    override func loadView() {
        self.view = BasketView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadProducts()
    }
    private func loadProducts() {
        basketViewModel.loadProduct()
        basketView.viewModel = basketViewModel
    }
    
}
