//
//  ProfileViewController.swift
//  HayBase
//
//  Created by Katya Michal on 15.07.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    
    // MARK: - ViewModel ans View
    
    private let profileViewModel: ProfileViewModel
    
    private var profileView: ProfileView { return self.view as! ProfileView }
    
    // MARK: - Inits
    
    init(profileViewModel: ProfileViewModel) {
        self.profileViewModel = profileViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle
    
    override func loadView() {
        self.view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
