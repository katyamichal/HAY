//
//  ProfileView.swift
//  HayBase
//
//  Created by Katya Michal on 28.08.2023.
//

import UIKit

enum ProfileSection: CaseIterable {
    case profile
    case discount
    case office
    case logout
}

final class ProfileView: UIView {
    // view model
    private var infoType: [String] = ["my purchases", "favourite", "hay offices & showrooms", "sustainability", "contact", "privacy notice"]

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
    
    
    // MARK: - UI Element
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.backgroundColor = .clear
        
        table.register(ProfileCell.self)
        table.register(DiscountCell.self)
        table.register(OfficeCell.self)
        table.register(LogoutCell.self)
        
        return table
    }()
}

// MARK: - Setup methods

extension ProfileView {
    
    private func setupStyles() {
        backgroundColor = Colours.Main.hayBackground
    }

    private func setupViews() {
        addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
       
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - Table View Data Source

extension ProfileView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = ProfileSection.allCases[section]
        switch section {
        case .profile:
            return 1
        case .discount:
            return 1
        case .office:
            return infoType.count
        case .logout:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = ProfileSection.allCases[indexPath.section]
        
        switch section {
        case .profile:
            let cell = tableView.dequeue(indexPath) as ProfileCell
            return cell
        case .discount:
            let cell = tableView.dequeue(indexPath) as DiscountCell
            return cell
        case .office:
            let cell = tableView.dequeue(indexPath) as OfficeCell
            cell.update(productInfo: infoType[indexPath.row])
            return cell
        case .logout:
            let cell = tableView.dequeue(indexPath) as LogoutCell
            return cell
        }
    }
}

extension ProfileView: UITableViewDelegate {}
