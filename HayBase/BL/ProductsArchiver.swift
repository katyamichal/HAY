//
//  ProductsArchiver.swift
//  HayBase
//
//  Created by Katya Michal on 04.08.2023.
//

import Foundation

/// нужен callback для обновления данных в приложении?
///

//protocol ProductArchiverDelegate: AnyObject {
//    var onChangedData: (()->()) { get set }
//}

protocol ProductArchiverInput {
    func save(_ products: [LocalProduct])
    func retrieve() -> [LocalProduct]?
    func delete(_ product: LocalProduct)

}

final class ProductArchiver: ProductArchiverInput {
    
  //  weak var delegate: ProductArchiverDelegate?
    
    static let productArchiver = ProductArchiver()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Products"
    
    private let userDefaults = UserDefaults.standard
    
    func save(_ products: [LocalProduct]) {
        do {
            let data = try encoder.encode(products)
            
            UserDefaults.standard.set(data, forKey: key)
           // print("\(products) has been successfully saved")
           
            
        } catch {
            print("error to save data to User Defaults")
        }
       
    }
    
    func retrieve() -> [LocalProduct]? {
        
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            let array = try decoder.decode(Array<LocalProduct>.self, from: data)
            return array
        } catch {
            print("Error to retrieve data from User Defaults")
        }
        return nil
    }
    
    func delete(_ product: LocalProduct) {
        
        guard let data = UserDefaults.standard.data(forKey: key)
                
        else {
            
            print("There is no data in User Defaults with the key name: \(key)")
            
            return
            
        }
        do {
            var products = try decoder.decode(Array<LocalProduct>.self, from: data)
            
            products.removeAll(where: { $0.id == product.id})
            
            guard let updatedData = try? encoder.encode(products) else {return}
            
            UserDefaults.standard.set(updatedData, forKey: key)
       
            
        } catch {
            print("Error to remove data from User Defaults")
        }
    }
}
