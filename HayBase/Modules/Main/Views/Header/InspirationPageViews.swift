//
//  InspirationPageViews.swift
//  HayBase
//
//  Created by Katya Michal on 13.07.2023.
//

import UIKit

final class InspirationView: UIView {
    
    // MARK: - Changable constraints
    
    var inspirationFeed: LocaleInspirationFeed?
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colours.Main.hayBackground.withAlphaComponent(0.5)
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Setup methods

    private func setupViews() {
        addSubview(imageView)
        imageView.addSubview(view)
        view.addSubview(collectionLabel)
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: self.bounds.size.width),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            
            view.topAnchor.constraint(equalTo: imageView.topAnchor),
            view.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 135),
            
            
            collectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            collectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionLabel.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: self.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    
    // MARK: -  Public
    
    func update(with model: LocaleInspirationFeed) {
        self.inspirationFeed = model
        collectionLabel.text = model.collectionName.uppercased()
        imageView.image = UIImage(named: "\(model.coverImage)")
    }
}

