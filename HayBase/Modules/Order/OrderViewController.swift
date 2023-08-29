//
//  OrderViewController.swift
//  HayBase
//
//  Created by Katya Michal on 28.08.2023.
//

import UIKit

final class OrderViewController: UIViewController {
    
    // MARK: - ViewModel and View
    
    private let orderViewModel: OrderViewModel
    
    private var orderView: OrderView { return self.view as! OrderView }


    // MARK: - Inits
    
    init(orderViewModel: OrderViewModel) {
        self.orderViewModel = orderViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Cycle
    
    override func loadView() {
        self.view = OrderView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
