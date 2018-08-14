//
//  SuggestionCollectionViewCell.swift
//  Unit
//
//  Created by Siham Hadi on 3/10/18.
//  Copyright © 2018 Unit All rights reserved.
//



import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
        }
    }
    
}
















