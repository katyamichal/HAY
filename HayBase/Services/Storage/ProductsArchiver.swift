//
//  ProductsArchiver.swift
//  HayBase
//
//  Created by Katya Michal on 04.08.2023.
//

import Foundation



protocol ProductArchiverInput {
    func save(_ product: LocalProduct)
    func retrieve() -> [LocalProduct]?
    func delete(_ product: LocalProduct)
}

enum ArchiverKey: String {
    case favourite
    case productToBuy
}



final class ProductArchiver: ProductArchiverInput {
    // MARK: - Init
    
    init(productType: ArchiverKey) {
        self.key = productType
    }
    // MARK: - Properties
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key: ArchiverKey
    
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Public methods
    #warning("переделать")
    
    func save(_ product: LocalProduct) {
        
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            var products = [LocalProduct]()

            do {
                products = try decoder.decode(Array<LocalProduct>.self, from: data)
                if products.first(where: {$0.id == product.id}) == nil  {
                    products.append(product)
                } else {
                    return
                }

            } catch {
                print("error to decode local product array with key: \(key.rawValue)")
            }
    //
            
            do {
                let data = try encoder.encode(products)
                UserDefaults.standard.set(data, forKey: key.rawValue)
                print("\(products) has been successfully saved")
                
            } catch {
                print("error to save data to User Defaults")
            }
           
            
        } else {
            do {
                let data = try encoder.encode([product])
                UserDefaults.standard.set(data, forKey: key.rawValue)
                print("\(product) has been successfully saved")
                
            } catch {
                print("error to save data to User Defaults")
            }
        }


       // print("There is no data in User Defaults with the key name: \(key)")
     
    }
    
    
    
    func delete(_ product: LocalProduct) {
        
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else {
            
            print("There is no data in User Defaults with the key name: \(key)")
            return
        }
        
        
        do {
            var products = try decoder.decode(Array<LocalProduct>.self, from: data)
            
            products.removeAll(where: { $0.id == product.id})
            
            guard let updatedData = try? encoder.encode(products) else {return}
            
            UserDefaults.standard.set(updatedData, forKey: key.rawValue)
            
        } catch {
            print("Error to remove data from User Defaults")
        }
    }
    
    func retrieve() -> [LocalProduct]? {
        
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }
        
        
        do {
            let array = try decoder.decode(Array<LocalProduct>.self, from: data)
            return array
            
        } catch {
            print("Error to retrieve data from User Defaults")
        }
        return nil
    }
}
