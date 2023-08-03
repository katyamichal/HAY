//
//  InsipationTableCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 11.07.2023.
//

import UIKit

//final class InsipationTableCell: UITableViewCell {
//    
//    var inspiration: InspirationProduct?
//    // MARK: - Inits
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
//       
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - UI Elements
//    private let containerView: UIView = {
//        let view = UIView()
//        
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    private let headerLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 21, weight: .medium)
//        label.numberOfLines = 0
//        label.text = "Inspiration"
//        return label
//    }()
//    
//    private lazy var collectionView: UICollectionView = {
//        let layout = createLayout()
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.showsHorizontalScrollIndicator = false
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.delegate = self
//        collection.dataSource = self
//        collection.register(InspirationCollectionCell.self, forCellWithReuseIdentifier: InspirationCollectionCell.cellIdentifier)
//        return collection
//    }()
//    
//    // MARK: - Public
//    func update(_ inspiration: InspirationProduct) {
//        self.inspiration = inspiration
//        self.headerLabel.text = "\(inspiration.collectionName)"
//    }
//}
//
//extension InsipationTableCell {
//    private func setupViews() {
//        contentView.addSubview(containerView)
//        containerView.addSubview(headerLabel)
//        containerView.addSubview(collectionView)
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            
//            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            containerView.heightAnchor.constraint(equalToConstant: Layout.width),
//            
//            
//            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
//            headerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
//            headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
//            
//            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            
//            
//        ])
//    }
//
//}
//
//// MARK: - Collection View Delegate and Data Source
//
//extension InsipationTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return inspiration?.products.count ?? 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InspirationCollectionCell.cellIdentifier, for: indexPath) as? InspirationCollectionCell else {
//            fatalError()
//        }
//        
//        guard let inspirationProduct = inspiration?.products[indexPath.row] else {
//            fatalError()
//        }
//        cell.update(inspirationProduct)
//        return cell
//    }
//    
//    
//}
//
//// MARK: - Compositional layout
//
//extension InsipationTableCell {
//    func createLayout() -> UICollectionViewLayout {
//        
//        let layout = UICollectionViewCompositionalLayout {
//            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
//            // 1 leading item
//            let leadingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
//                                                         heightDimension: .fractionalHeight(1.0))
//            
//            let leadingItem = NSCollectionLayoutItem(layoutSize: leadingItemSize)
//            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
//            
//            // 2, 3 trailng items
//            
//            let trailingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                          heightDimension: .fractionalHeight(0.4))
//            let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
//            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
//            
//            let trailingGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
//                                                   heightDimension: .fractionalHeight(1.0)),
//                subitem: trailingItem, count: 2)
//            // Group then
//            let containerGroup = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
//                                                   heightDimension: .fractionalHeight(1)),
//                subitems: [leadingItem, trailingGroup])
//            
//            // Section
//            let section = NSCollectionLayoutSection(group: containerGroup)
//            section.orthogonalScrollingBehavior = .continuous
//            
//            return section
//            
//        }
//        return layout
//    }
//}

