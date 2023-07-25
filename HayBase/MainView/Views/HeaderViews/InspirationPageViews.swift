//
//  InspirationPageViews.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 13.07.2023.
//

import UIKit

final class InspirationView: UIView {
    
  var imageViewHeight = NSLayoutConstraint()
  var imageViewBottom = NSLayoutConstraint()

    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private let collectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee Lover Collection"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6.withAlphaComponent(0.7)
        return view
    }()
    
     let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    private func setupViews() {
        addSubview(imageView)
        imageView.addSubview(view)
        view.addSubview(collectionLabel)
        imageView.addSubview(detailButton)
    }
    
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            imageView.widthAnchor.constraint(equalToConstant: self.bounds.size.width),
//            imageView.heightAnchor.constraint(equalToConstant: self.bounds.size.height),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           // imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            view.topAnchor.constraint(equalTo: imageView.topAnchor),
            view.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 135),
            
            collectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            collectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionLabel.heightAnchor.constraint(equalToConstant: 40),
            //            collectionLabel.widthAnchor.constraint(equalToConstant: self.bounds.size.width),
            //
            // detailButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            detailButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            detailButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            detailButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        //imageViewHeight = imageView.heightAnchor.constraint(equalToConstant: self.bounds.size.height)
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: self.heightAnchor)
        imageViewHeight.isActive = true
    }
    // MARK: -  Public
    
    func update(with model: InspirationFeed) {
        collectionLabel.text = model.collectionName.uppercased()
        imageView.image = UIImage(named: "\(model.coverImage)")
    }

}

