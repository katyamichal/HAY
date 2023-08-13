//
//  PopularProductCell.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.
//

import UIKit

protocol ProductCellDelegate: AnyObject {
    func didSelectProduct(product: LocalProduct)
}

final class ProductCell: UITableViewCell {
    
    var products: [LocalProduct] = []
    weak var delegate: ProductCellDelegate?
    
    // MARK: - UI Elements
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.text = "Popular".uppercased()
        return label
    }()
    
    
    //private
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Layout.width * 0.6, height: Layout.width * 0.8)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
      //  collection.delegate = self
        collection.dataSource = self
        collection.register(ProductCollectionCell.self, forCellWithReuseIdentifier: ProductCollectionCell.cellIdentifier)
        return collection
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func update(_ products: [LocalProduct]) {
     
        self.products = products
        self.collectionView.reloadData()
    
    }
}
// MARK: - Setups

extension ProductCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(headerLabel)
        containerView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Layout.width),
            
            
            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            
        ])
    }
}
// MARK: -  Collection Data Source and Delegate

extension ProductCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.cellIdentifier, for: indexPath) as? ProductCollectionCell else {
            fatalError("Product Collection Cell")
        }
        
        let product = products[indexPath.item]
        cell.update(product)
        
        return cell
    }
}
