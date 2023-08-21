//
//  BasketView.swift
//  HayBase
//
//  Created by Katya Michal on 20.08.2023.
//

import UIKit

enum CartTableSection: CaseIterable {
    case products
    case orderInfo
}

final class BasketView: UIView {

    // MARK: - View Model
    
    var viewModel: BasketViewModel? {
        didSet {
            guard let count = viewModel?.products?.count, count > 0 else {
                tableView.isHidden = true
                headerLabel.text = "Your shopping basket is empty. See if your favourites are in your basket."
                return
            }
            updateView()
        }
    }
  
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
    // MARK: - UI Elements
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
      //  label.text = "shopping basket".uppercased()
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.textColor = .label
        label.numberOfLines = 0
        //Your shopping basket is empty
        // See if your favourites are in your basket or add items from the new collection ---> button
        return label
    }()

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.allowsSelection = false
        table.isHidden = true
        table.register(ProductTableCell.self)
        table.register(OrderInfoCell.self)
        
        return table
    }()
    
    // MARK: - Private

    private func updateView() {
        headerLabel.text = "shopping basket".uppercased()
        tableView.isHidden = false
        tableView.reloadData()
    }
}


// MARK: - Setup methods

extension BasketView {
    
    
    private func setupStyles() {
        self.backgroundColor = .systemBackground
    }
    
    
    private func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        addSubview(headerLabel)
        addSubview(tableView)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Table View Data Source

extension BasketView: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CartTableSection.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = CartTableSection.allCases[section]
        
        switch section {
        case .products:
            return viewModel?.products?.count ?? 0
        case .orderInfo:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = CartTableSection.allCases[indexPath.section]
        switch section {
            
        case .products:
            let cell = tableView.dequeue(indexPath) as ProductTableCell
            guard let products = viewModel?.products else {
                return cell
            }
            let product = products[indexPath.row]
            cell.update(product)
            return cell
            
        case .orderInfo:
            let cell = tableView.dequeue(indexPath) as OrderInfoCell
            guard let viewModel = viewModel, viewModel.orderInfo.count == 3 else {return cell}
            cell.update(orderInfo: viewModel.orderInfo)
            return cell
        }
    }
}
extension BasketView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0 else { return UITableView.automaticDimension }
        return Layout.width * 0.4
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard indexPath.section == 0 else { return false}
        return true
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let delete = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in
            print("Delete")
        }
        delete.image = UIImage(systemName: "multiply")
        delete.backgroundColor = .black
        
        
        let addToFavourite = UIContextualAction(style: .normal, title: "add to favourite") { _, _, _ in
            print("addToFavourite")
        }
        addToFavourite.image = UIImage(systemName: "heart")
        addToFavourite.backgroundColor = .brown.withAlphaComponent(0.7)
        
        
        
        let swipe = UISwipeActionsConfiguration(actions: [delete, addToFavourite])
        swipe.performsFirstActionWithFullSwipe = false
        return swipe
    }
}
