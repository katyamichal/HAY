//
//  ViewController.swift
//  HayBase
//
//  Created by Katya Michal on 26.07.2023.
//

import UIKit

final class InspirationDetailViewController: UIViewController {
    
    private let viewModel: InspoDetailViewModel
    
    private lazy var detailView = InspirationDetailView(frame: .zero, viewModel: viewModel)
    
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
        self.view = detailView

        detailView.collectionView.delegate = self
        setupConstraints()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        setupNavBarButton()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.update()
        detailView.viewModel = viewModel
    }
    
    
    private func setupNavBarButton() {
        let leftButtonImageConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .light)
        
        let leftButtonImage = UIImage(systemName: "chevron.left", withConfiguration: leftButtonImageConfiguration)?.withTintColor(.black)
        
        let leftBarButton = UIBarButtonItem(image: leftButtonImage, style: .done, target: self, action: #selector(backToMainView))
        navigationItem.leftBarButtonItem = leftBarButton
        
        
        let rightButtonImageConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .light)
        let rightButtonImage = UIImage(systemName: "square.and.arrow.up", withConfiguration: rightButtonImageConfiguration)
        
        let rightBarButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    @objc
    private func backToMainView() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }
}

// MARK: - Collection View Delegate

extension InspirationDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let product = viewModel.inspoProducts?[indexPath.item],
        indexPath.section == 1 else { return }
        
        let productDetailViewModel = ProductDetailViewModel(product: product)
        let productDetailVC = ProductDetailViewController(viewModel: productDetailViewModel)
        
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
