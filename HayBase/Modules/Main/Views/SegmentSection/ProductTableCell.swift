//
//  PopularProductCell.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    var onLocalProductDidChanged: ((LocaleProduct)->())?
    var onDidSelectedSegmentProduct: ((LocaleProduct)->())?
    
    var products: [LocaleProduct] = []
    

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
        label.textColor = .black
        return label
    }()
    

    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Layout.width * 0.6, height: Layout.width * 0.8)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(ProductCollectionCell.self, forCellWithReuseIdentifier: ProductCollectionCell.cellIdentifier)
        collection.register(LoadingCollectionCell.self, forCellWithReuseIdentifier: LoadingCollectionCell.cellIdentifier)
        collection.backgroundColor = .clear
        return collection
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func update(_ products: [LocaleProduct]) {
        headerLabel.text = "Popular".uppercased()
        self.products = products
        collectionView.reloadData()
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
        
        return products.count == 0 ? 3 : products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if products.isEmpty {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCollectionCell.cellIdentifier, for: indexPath) as? LoadingCollectionCell else {
                fatalError("")
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.cellIdentifier, for: indexPath) as? ProductCollectionCell else {
                fatalError("Product Collection Cell")
            }
            
            cell.likeButton.onLikeButtonTapped = { isLiked, product in
                self.onLocalProductDidChanged?(product)
            }
            
            let product = products[indexPath.item]
            cell.update(product)
            
            return cell
        }
    }
}

extension ProductCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !products.isEmpty else {return}
        let product = products[indexPath.item]
        onDidSelectedSegmentProduct?(product)
    }
}
