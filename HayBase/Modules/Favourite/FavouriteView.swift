//
//  FavouriteView.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import UIKit

protocol FavouriteViewDelegate: AnyObject {
    func updateViewModel(with product: LocalProduct)
}

final class FavouriteView: UIView {
   
    
    // MARK: - View Model

    var viewModel: FavouriteViewModel? {
        didSet {
            guard let products = viewModel?.favProducts, !products.isEmpty else {
                collectionView.isHidden = true
                return
            }
            update()
        }
    }
    
    
    // MARK: - UI Elements
   lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(FavouriteProductCell.self, forCellWithReuseIdentifier: FavouriteProductCell.cellIdentifier)
        return collection
    }()
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "You don't have any favourite products yet"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .light)
        label.textColor = .label
        label.numberOfLines = 0
        label.isHidden = false
        return label
    }()

    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyles()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .flexible(16)

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func update() {
        headerLabel.text = "Favourite".uppercased()
        collectionView.isHidden = false
        collectionView.reloadData()
    }
}

// MARK: - Constraints

extension FavouriteView {
    private func setupStyles() {
        self.backgroundColor = .systemBackground
    }
    
    private func setupViews() {
        addSubview(collectionView)
        addSubview(headerLabel)
     
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            headerLabel.heightAnchor.constraint(equalToConstant: 200),
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}

extension FavouriteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.favProducts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteProductCell.cellIdentifier, for: indexPath) as? FavouriteProductCell else {fatalError("Error to dequeue FavouriteProductCell")}
        
        let favProduct = viewModel?.favProducts[indexPath.item]
        cell.update(favProduct ?? nil)
        return cell
    }
}

extension FavouriteView: UICollectionViewDelegate {}
