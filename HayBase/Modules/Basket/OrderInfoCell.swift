//
//  OrderInfoCell.swift
//  HayBase
//
//  Created by Katya Michal on 20.08.2023.
//

import UIKit

final class OrderInfoCell: UITableViewCell {
    

    // MARK: - UI Elements
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    
    private let subtotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Total"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let pricelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Place your order", for: .normal)
        button.backgroundColor = .black
      
        return button
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func update(orderInfo: [Int]) {
        subtotalLabel.text = "Subtotal  £\(orderInfo[0])"
        deliveryLabel.text = "Delivery  £\(orderInfo[1])"
        pricelLabel.text = "£\(orderInfo[2])"
    }
}
    // MARK: - Constraints

    extension OrderInfoCell {

        private func setupViews() {
            contentView.addSubview(verticalStackView)
            contentView.addSubview(totalStackView)
            contentView.addSubview(orderButton)
            
            verticalStackView.addArrangedSubview(subtotalLabel)
            verticalStackView.addArrangedSubview(deliveryLabel)
            
            totalStackView.addArrangedSubview(totalLabel)
            totalStackView.addArrangedSubview(pricelLabel)
            
            
        }

        private func setupConstraints() {
        
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
                verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                verticalStackView.heightAnchor.constraint(equalToConstant: 60),
                verticalStackView.widthAnchor.constraint(equalToConstant: Layout.width / 2.1),
                verticalStackView.bottomAnchor.constraint(equalTo: totalStackView.topAnchor),
                
             
                totalStackView.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: 10),
                totalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                totalStackView.heightAnchor.constraint(equalToConstant: 50),
        
                totalStackView.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -40),
               
                
                orderButton.widthAnchor.constraint(equalToConstant: Layout.width / 1.1),
                orderButton.heightAnchor.constraint(equalToConstant: 50),
                orderButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                orderButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
            
            ])
        }
    }

    

