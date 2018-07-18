//
//  Clothes.swift
// Unit
//
//  Created by Siham Hadi on 3/10/18.
//  Copyright © 2018 Unit All rights reserved.
//


import UIKit

class Shoe
{
    var uid: String?
    var name: String?
    var images: [UIImage]?
    var price: String?
     var priceRent: Double?
    var description: String?
    var detail: String?
    
    init(uid: String, name: String, images: [UIImage], price: String, priceRent: Double,  description: String, detail: String)
    {
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.priceRent = priceRent
        self.description = description
        self.detail = detail
    }
    
    class func fetchShoes() -> [Shoe]
    {
        var shoes = [Shoe]()
        
        // 1
        var shoe1Images = [UIImage]()
        for _ in 1...5{
            shoe1Images.append(UIImage(named: "e\(1)")!)
        }
        let shoe1 = Shoe(uid: "875942-100", name: "Dagmar - Coat", images: shoe1Images,price:"15", priceRent:68, description: "", detail: "")
        shoes.append(shoe1)
        
        // 2
        var shoe2Images = [UIImage]()
        for _ in 1...3 {
            shoe2Images.append(UIImage(named: "x1")!)
        }
        let shoe2 = Shoe(uid: "880843-003", name: " Rodebjer - Trousers ", images: shoe2Images, price: "15", priceRent:97, description: "", detail: "")
        shoes.append(shoe2)
        
        
        // 3
        var shoe3Images = [UIImage]()
        for _ in 1...6 {
            shoe3Images.append(UIImage(named: "j1")!)
        }
        let shoe3 = Shoe(uid: "384664-113", name: "Hope - Jacket", images: shoe3Images, price:"39", priceRent:107, description: "", detail:"")
        shoes.append(shoe3)
        
        // 4
        var shoe4Images = [UIImage]()
        for i in 1...6 {
            shoe4Images.append(UIImage(named: "f\(i)")!)
        }
        let shoe4 = Shoe(uid: "805144-852", name: "Filippa k", images: shoe4Images, price: "47", priceRent:80, description: "", detail: "")
        shoes.append(shoe4)
        
        return shoes
    }
}
























