//
//  ViewController.swift
//  HayBase
//
//  Created by Katya Michal on 26.07.2023.
//

import UIKit

final class InspirationDetailViewController: UIViewController, InspirationDetailViewDelegate {
    func updateViewModel(with product: LocalProduct) {
        viewModel.updateProducts(with: product)
    }
    
    
    private let viewModel: InspoDetailViewModel
    
    // MARK: - Inits
    
    init(viewModel: InspoDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle
    override func loadView() {
        super.loadView()
        
        let detailView = InspirationDetailView(frame: .zero, viewModel: viewModel)
        
        self.view = detailView
        detailView.delegate = self
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        setupNavBarButton()
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
    
    /// delegate
    /// func getLikedProduct() {
    ///   viewModel.saveFavorite(product)
    ///}
    /// //
}
