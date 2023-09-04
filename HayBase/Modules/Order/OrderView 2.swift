
//
//  Created by Katya Michal on 28.08.2023.
//


enum OrderSection: CaseIterable {
    case orderAddress
    case dateAndProduct
    case receiverInfo
    case payment
}


import UIKit

final class OrderView: UIView {

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyles()
        setupViews()
        setupConstraints()
        tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Element
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "checkout".uppercased()
        label.textColor = .black
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.backgroundColor = .clear
        
        table.register(OrderAddressCell.self)
        table.register(DateCell.self)
        table.register(ReceiverCell.self)
        table.register(PaymentCell.self)
        return table
    }()
}
// MARK: - Setup methods

extension OrderView {
    
    private func setupStyles() {
        backgroundColor = .hayMain
    }
    
    
    private func setupViews() {
        addSubview(headerLabel)
        addSubview(tableView)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
       
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Table View Data Source

extension OrderView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return OrderSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = OrderSection.allCases[section]
        switch section {
        case .orderAddress:
            return 1
        case .dateAndProduct:
            return 1
        case .receiverInfo:
            return 1
        case .payment:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = OrderSection.allCases[indexPath.section]
        
        switch section {
        case .orderAddress:
            let cell = tableView.dequeue(indexPath) as OrderAddressCell
           return cell
        case .dateAndProduct:
            let cell = tableView.dequeue(indexPath) as DateCell
            return cell
        case .receiverInfo:
            let cell = tableView.dequeue(indexPath) as ReceiverCell
            return cell
        case .payment:
            let cell = tableView.dequeue(indexPath) as PaymentCell
            return cell
        }
    }
}

extension OrderView: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
}
