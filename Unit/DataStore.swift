//
//  DataStore.swift
//  Unit
//
//  Created by Siham Hadi on 2018-09-16.
//  Copyright © 2018 Unit. All rights reserved.
//

import Foundation
import UIKit



final class DataStore{
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var products: [Product] = []
    var images: [UIImage] = []
    
    func getProducts(completion: @escaping () -> Void) {
        
        APIClient.getProductsApi { (json) in
            let feed = json? ["feed"] as? ProductsJSON
            if let results = feed? ["results"] as? [ProductsJSON] {
                for dict in results {
                    let newProduct = Product(dictionary: dict)
                    self.products.append(newProduct)
                }
                completion()
            }
        }
        
    }
    func getProductImages(completion: @escaping () -> Void) {
        getProducts {
            for product in self.products {
                let url = URL(string: product.coverImage)
                let data = try? Data (contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
    
    
}
