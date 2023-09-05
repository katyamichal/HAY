//
//  LoadingDesignerCell.swift
//  HayBase
//
//  Created by Katya Michal on 04.09.2023.
//

import UIKit

final class LoadingDesignerCell: UITableViewCell {
    
    
    // MARK: - UI Elements
    
    private let shimmeringView: UIView = {
        let view = UIView()
        view.backgroundColor = Colours.Gradient.gradientSilverGrey.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    // MARK: - Collection View
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Layout.width * 0.5, height: Layout.width * 0.7)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        
        collection.register(LoadingDisignerProductCell.self, forCellWithReuseIdentifier: LoadingDisignerProductCell.cellIdentifier)
        
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

}

// MARK: - Setup methods

extension LoadingDesignerCell {
    private func setupViews() {
        contentView.addSubview(shimmeringView)
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            shimmeringView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            shimmeringView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shimmeringView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shimmeringView.heightAnchor.constraint(equalToConstant: 300),
            
            
            collectionView.topAnchor.constraint(equalTo: shimmeringView.bottomAnchor, constant: -40),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
}

extension LoadingDesignerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingDisignerProductCell.cellIdentifier, for: indexPath) as? LoadingDisignerProductCell else {
            fatalError()
        }
        return cell
    }
}
