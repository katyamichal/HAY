//
//  InspirationDetailView.swift
//  HayBase
//
//  Created by Katya Michal on 26.07.2023.
//

import UIKit

enum DetailType {
    case designer
   // case inspiration
}

protocol InspirationDetailViewDelegate: AnyObject {
    func updateViewModel(with product: LocalProduct)
}

final class InspirationDetailView: UIView, InspoProductCellDelegate {
    
    func updateViewModel(with product: LocalProduct) {
        delegate?.updateViewModel(with: product)
    }
    
    weak var delegate: InspirationDetailViewDelegate?
    
  //  var onLikedButtonTapped: ((Product)->())?
    
    enum SectionType: CaseIterable {
        case photoAndDescription
        case product
    }
    
     var viewModel: InspoDetailViewModel {
        didSet {
            collectionView.reloadData()
        }
    }
    // MARK: - UI Element

    private lazy var collectionView: UICollectionView = {
        
        let layout = createCollectionView()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(InspirationDetailCell.self, forCellWithReuseIdentifier: InspirationDetailCell.cellIdentifier)
        
        collection.register(InspoProductCell.self, forCellWithReuseIdentifier: InspoProductCell.cellIdentifier)
   
        return collection
    }()
    
    
    // MARK: - Init
    
    init(frame: CGRect, viewModel: InspoDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
        setupConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout methods
    
    private func setupView() {
        addSubview(collectionView)
    }

    private func setupConstraints() {
  
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func createCollectionView() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let isWideView = layoutEnviroment.container.effectiveContentSize.width > 500
            
            let sectionLayoutKind = SectionType.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .photoAndDescription: return self.createDescriptionLayout(isWide: isWideView)
            case .product: return self.createProductsLayout(isWide: isWideView)
            }
        }, configuration: config)
        
        return layout
        }
    // MARK: - collection section' layouts

    private func createDescriptionLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1.7))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupFractionalWidth = isWide ? 0.855 : 1.0
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupFractionalWidth), heightDimension: .fractionalWidth(1.75))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section

    }
    
    private func createProductsLayout(isWide: Bool) -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupFractionalWidth = isWide ? 0.855 : 1.0
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupFractionalWidth), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item])

        group.interItemSpacing = .flexible(16)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
}
// MARK: - Collection Data Source

extension InspirationDetailView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return SectionType.allCases.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .photoAndDescription: return 1
        case .product: return viewModel.inspoProducts?.count ?? 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = SectionType.allCases[indexPath.section]
      
        switch sectionType {
      
        case .photoAndDescription:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InspirationDetailCell.cellIdentifier, for: indexPath) as? InspirationDetailCell else {fatalError("InspirationDetailCell did't dequeue")}
            
            cell.update(with: viewModel.inpirationFeed)
            
            return cell
            
        case .product:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InspoProductCell.cellIdentifier, for: indexPath) as? InspoProductCell else {fatalError("InspoProductCell did't dequeue")}
            
            if let products = viewModel.inspoProducts {
                let product = products[indexPath.item]
                cell.update(product)
                cell.delegate = self
            }
            return cell
        }
    }
}

extension InspirationDetailView: UICollectionViewDelegate {}

