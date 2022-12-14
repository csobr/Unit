//
//  FeedShoeTableViewCell.swift
//  Unit
//
//  Created by  on 3/19/17.
//  Copyright © 2018 Unit All rights reserved.
//

import UIKit

class FeedShoeTableViewCell : UITableViewCell
{
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var RentPrice: UILabel!
    
    var shoe: Shoe! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        shoeImageView.image = shoe.images?.first
        shoeNameLabel.text = shoe.name
        if let price = shoe.price {
            shoePriceLabel.text =  "\(price) min"
        }
       
        if let priceRent = shoe.priceRent {
         RentPrice.text = "$\(priceRent)"
        }else {
            RentPrice.text = ""
        }
    }
}
