//
//  Exten + UITableView.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 06.07.2023.
//

import UIKit
extension UITableView {
    
    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }
    
    func dequeue<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError("Error to dequeue cell at \(indexPath)")
        }
        return cell
        
    }
}
