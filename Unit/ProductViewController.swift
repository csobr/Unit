//
//  ProductViewController.swift
//  Unit
//
//  Created by Siham Hadi on 2018-09-12.
//  Copyright © 2018 Unit. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    //Mark : Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
 
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
// Mark: - Properties
    let images = [#imageLiteral(resourceName: "t2.jpg"),#imageLiteral(resourceName: "z1.jpg"),#imageLiteral(resourceName: "r1.jpg"),#imageLiteral(resourceName: "u1.jpg"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu()
    
    
    }
//  Side Menu
func sideMenu() {
    if SWRevealViewController() != nil {
        
        menuButton.target = SWRevealViewController()
        menuButton.action = #selector (SWRevealViewController.revealToggle(_:))
        SWRevealViewController().rearViewRevealWidth =  275
        SWRevealViewController().rightViewRevealWidth = 160
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
}
    //Mark: - Flow layout delegate
    
        extension ProductViewController: UICollectionViewDelegateFlowLayout{
        
        //MARK: - UICollectionViewDelegateFlowLayout
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: 175.0, height: 400.0)
        }
    }
    
    
    
    
    
    //Mark: Datasource
    extension ProductViewController:UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
            UICollectionViewCell {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
                let image = images[indexPath.item]
                cell.imageView.image = image
                
                return cell
                
                
        }
}


    

