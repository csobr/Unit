//
//  ProductCell.swift
//  Astur
//
//  Created by Siham Hadi on 2018-09-12.
//  Copyright © 2018 Siham Hadi. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var rentprice: UILabel!
    
    func displayContent( image: UIImage, title : String,  price: String){
        
        imageView.image = image
        productName.text = title
        rentprice.text = price
    }
    
}
