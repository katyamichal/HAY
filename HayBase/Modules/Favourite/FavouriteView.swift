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

final class FavouriteView: UIView, BasicProductCellDelegate {
    func updateViewModel(with product: LocalProduct) {
        delegate?.updateViewModel(with: product)
    }
    
   
    weak var delegate: FavouriteViewDelegate?
    // MARK: - View Model
    
     func update(viewModel: FavouriteViewModel) {
        self.viewModel = viewModel
    }
    
    var viewModel: FavouriteViewModel? {
        didSet {
            guard (viewModel?.products) != [] else {
                collectionView.isHidden = true
                headerLabel.text = "You don't have any favourite products yet  :( "
                return
            }

          updateView()
        }
    }
    
    // MARK: - UI Elements
   lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
//        collection.register(FavouriteProductCell.self, forCellWithReuseIdentifier: FavouriteProductCell.cellIdentifier)
       
       collection.register(BasicProductCell.self, forCellWithReuseIdentifier: BasicProductCell.cellIdentifier)
        return collection
    }()
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.textColor = .label
        label.numberOfLines = 0
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
    
    // MARK: - Layout

    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .flexible(16)

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    // MARK: - Private

    private func updateView() {
        headerLabel.text = "favourite".uppercased()
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
            
            headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}
// MARK: - UICollectionViewDataSource and Delegate

extension FavouriteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteProductCell.cellIdentifier, for: indexPath) as? FavouriteProductCell else {fatalError("Error to dequeue FavouriteProductCell")}
//
//        let favProduct = viewModel?.products?[indexPath.item]
//        cell.update(favProduct ?? nil)
//        return cell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicProductCell.cellIdentifier, for: indexPath) as? BasicProductCell else {fatalError("Error to dequeue FavouriteProductCell")}
        guard let favProduct = viewModel?.products?[indexPath.item]
        else {
            return cell
        }
        cell.update(favProduct)
        cell.delegate = self
        return cell
    }
}

extension FavouriteView: UICollectionViewDelegate {}
