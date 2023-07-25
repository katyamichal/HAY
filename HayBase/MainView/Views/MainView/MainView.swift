

import UIKit

final class MainView: UIView {
    
    // MARK: - UI Elements
    var productTableView = MainTableView()

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
        addSubview(productTableView)
     
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: self.topAnchor),
            productTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            productTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            productTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

