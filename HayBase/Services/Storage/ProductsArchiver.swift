//
//  ProductsArchiver.swift
//  HayBase
//
//  Created by Katya Michal on 04.08.2023.
//

import Foundation

protocol ProductArchiverInput {
    func save(_ product: LocaleProduct)
    func retrieve() -> [LocaleProduct]?
    func delete(_ product: LocaleProduct)
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
    
    // MARK: - Static
    
    static var onFavouriteProductChanged: (()->())?
    
    static var favourite: [LocaleProduct]? {
        didSet {
            ProductArchiver.onFavouriteProductChanged?()
        }
    }
    
    // MARK: - Properties
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key: ArchiverKey
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Save method
#warning("переделать")
    
    func save(_ product: LocaleProduct) {
        
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            var products = [LocaleProduct]()
            
            do {
                products = try decoder.decode(Array<LocaleProduct>.self, from: data)
                if products.first(where: {$0.id == product.id}) == nil  {
                    products.append(product)
                    
                } else {
                    return
                }
                
            } catch {
                print("error to decode local product array with key: \(key.rawValue)")
            }
            
            
            do {
                let data = try encoder.encode(products)
                UserDefaults.standard.set(data, forKey: key.rawValue)
                
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
    }
    
    // MARK: - Delete method
    
    func delete(_ product: LocaleProduct) {
        
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else {
            
            print("There is no data in User Defaults with the key name: \(key)")
            return
        }
        
        do {
            var products = try decoder.decode(Array<LocaleProduct>.self, from: data)
            
            products.removeAll(where: { $0.id == product.id})
            
            guard let updatedData = try? encoder.encode(products) else {return}
            
            UserDefaults.standard.set(updatedData, forKey: key.rawValue)
    
        } catch {
            print("Error to remove data from User Defaults")
        }
    }
    // MARK: - Retrieve method

    func retrieve() -> [LocaleProduct]? {
        
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }
        
        do {
            let array = try decoder.decode(Array<LocaleProduct>.self, from: data)
            return array
            
        } catch {
            print("Error to retrieve data from User Defaults")
        }
        return nil
    }
}
