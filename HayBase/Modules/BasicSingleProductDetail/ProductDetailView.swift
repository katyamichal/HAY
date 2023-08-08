//
//  ProductDetailView.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 07.08.2023.
//

import UIKit

enum Sections: CaseIterable {
    case productImages
    case productInfo
}

final class ProductDetailView: UIView {
    
    var viewModel: ProductDetailViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupView()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UIElements
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
      
        tableView.register(ProductImageGaleryCell.self)
        tableView.register(ProductInfoCell.self)
        
       
        
        return tableView
    }()
    // MARK: - Setups

    private func setupView() {
        addSubview(tableView)
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}

extension ProductDetailView: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Sections.allCases[section]
        
        switch section {
        case .productImages:
            return 1
        case .productInfo:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = Sections.allCases[indexPath.section]
        switch section {
            
        case .productImages:
            let cell = tableView.dequeue(indexPath) as ProductImageGaleryCell
            guard let product = viewModel?.product,
            let images = viewModel?.images else {
                return cell
            }
            cell.update(with: product, images: images)
            return cell
            
        case .productInfo:
            let cell = tableView.dequeue(indexPath) as ProductInfoCell
            guard let productInfo = viewModel?.productInfo else {
                return cell
            }
            cell.update(with: productInfo, infoTypeIndex: indexPath.row)
            return cell
        }
    }
}

extension ProductDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0 else { return 50 }
        return Layout.height / 1.7
    }
}

