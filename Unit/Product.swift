//
//  Product.swift
//  Unit
//
//  Created by Siham Hadi on 2018-09-16.
//  Copyright © 2018 Unit. All rights reserved.
//

import Foundation

struct Product{
    let name: String
    let price: String
    let coverImage: String
    
    init(dictionary: ProductsJSON){
        self.name = dictionary["name"] as! String
        self.price = dictionary["price"] as! String
        self.coverImage = dictionary["imageurl"] as! String
    }
}
