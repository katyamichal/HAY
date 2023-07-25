//
//  Exten + UITableViewCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 06.07.2023.
//

import UIKit
protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String.init(describing: self)
    }
}


