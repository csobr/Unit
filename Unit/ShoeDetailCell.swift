//
//  ShoeDetailCell.swift
//  Unit
//
//  Created by Siham Hadi on 3/10/18.
//  Copyright © 2018 Unit All rights reserved.
//



import UIKit

class ShoeDetailCell : UITableViewCell
{
    @IBOutlet weak var shoeNameLabel: UILabel!
    
    var shoe: Shoe! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        shoeNameLabel.text = shoe.name

    }
}
