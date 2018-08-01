//
//  Shoe.swift
//  Nike+Research
//
//  Created by Duc Tran on 3/19/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class Shoe
{
    var uid: String?
    var name: String?
    var images: [UIImage]?
    var price: Double?
     var priceRent: Double?
    var description: String?
    var detail: String?
    
    init(uid: String, name: String, images: [UIImage], price: Double, priceRent: Double,  description: String, detail: String)
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
        for i in 1...5{
            shoe1Images.append(UIImage(named: "s\(i)")!)
        }
        let shoe1 = Shoe(uid: "875942-100", name: "Acne Studios - Lamp Black", images: shoe1Images,price: 380, priceRent:68, description: "", detail: "")
        shoes.append(shoe1)
        
        // 2
        var shoe2Images = [UIImage]()
        for i in 1...3 {
            shoe2Images.append(UIImage(named: "t\(i)")!)
        }
        let shoe2 = Shoe(uid: "880843-003", name: "Acne Studios - Hayett Print off black / black / orange fl ", images: shoe2Images, price: 540, priceRent:97, description: "", detail: "")
        shoes.append(shoe2)
        
        
        // 3
        var shoe3Images = [UIImage]()
        for i in 1...6 {
            shoe3Images.append(UIImage(named: "j\(i)")!)
        }
        let shoe3 = Shoe(uid: "384664-113", name: " Balenciaga - Hoodie", images: shoe3Images, price: 595, priceRent:107, description: "", detail:"")
        shoes.append(shoe3)
        
        // 4
        var shoe4Images = [UIImage]()
        for i in 1...6 {
            shoe4Images.append(UIImage(named: "f\(i)")!)
        }
        let shoe4 = Shoe(uid: "805144-852", name: "TECH FLEECE WINDRUNNER", images: shoe4Images, price: 130, priceRent:80, description: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.", detail: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.")
        shoes.append(shoe4)
        
        return shoes
    }
}























