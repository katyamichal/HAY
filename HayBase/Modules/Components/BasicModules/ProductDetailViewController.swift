//
//  ProductDetailViewController.swift
//  HayBase
//
//  Created by Katya Michal on 07.08.2023.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
    private let viewModel: ProductDetailViewModel
    
    private lazy var productDetailView = ProductDetailView(frame: .zero)
    
    // MARK: - Init

    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Cycle
    
    override func loadView() {
        super.loadView()
        self.view = productDetailView
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        productDetailView.viewModel = viewModel
    }
    
    
    private func setupNavBarButton() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .light)
        
        let image = UIImage(systemName: "chevron.left", withConfiguration: config)?.withTintColor(.black)
        
        let leftBarButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(backToMainView))
        navigationItem.leftBarButtonItem = leftBarButton
        
        
        let config2 = UIImage.SymbolConfiguration(pointSize: 18, weight: .light)
        let image2 = UIImage(systemName: "square.and.arrow.up", withConfiguration: config2)
        
        let rightBarButton = UIBarButtonItem(image: image2, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    @objc
    private func backToMainView() {
        navigationController?.popViewController(animated: true)
    }
    

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productDetailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            productDetailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            productDetailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            productDetailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }

}
