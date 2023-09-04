//
//  PaymentCell.swift
//  HayBase
//
//  Created by Katya Michal on 29.08.2023.
//

import UIKit

final class PaymentCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 5, weight: .light)
        let image = UIImage(systemName: "circle.fill", withConfiguration: imageConfiguration)
        imageView.image = image
        imageView.tintColor = .black
        return imageView
    }()
    
    private let paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "payment method"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    
    private let paymentDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "PayPal"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
        let image = UIImage(systemName: "chevron.right", withConfiguration: imageConfiguration)
        imageView.image = image
        imageView.tintColor = .black
        return imageView
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

extension PaymentCell {
    
    private func setupViews() {
        contentView.addSubview(circleImageView)
        contentView.addSubview(paymentLabel)
        contentView.addSubview(paymentDetailLabel)
        contentView.addSubview(chevronImageView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            paymentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            paymentLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 22),
            
            circleImageView.centerYAnchor.constraint(equalTo: paymentLabel.centerYAnchor),
            circleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            circleImageView.widthAnchor.constraint(equalToConstant: 10),
            circleImageView.heightAnchor.constraint(equalToConstant: 10),
            
            paymentDetailLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 6),
            paymentDetailLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 22),
            paymentDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            paymentDetailLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor),
            
            chevronImageView.topAnchor.constraint(equalTo: paymentLabel.topAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            chevronImageView.heightAnchor.constraint(equalToConstant: 20),
            chevronImageView.widthAnchor.constraint(equalToConstant: 15)
            
        ])
    }
}


