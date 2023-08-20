//
//  SeatingProductTableView.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.

import UIKit

final class MainView: UIView {
    
    // MARK: - UI Elements
    var mainTableView = MainTableView()

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
}
// MARK: - Constraints

extension MainView {
    private func setupStyles() {
        self.backgroundColor = .systemBackground
    }
    
    private func setupViews() {
        addSubview(mainTableView)
     
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

