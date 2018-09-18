//
//  ProductViewController.swift
//  Unit
//
//  Created by Siham Hadi on 2018-09-12.
//  Copyright © 2018 Unit. All rights reserved.
//
import Foundation
import UIKit

class ProductViewController: UIViewController {
    
    //Mark : Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
// Mark: - Properties
let store = DataStore.sharedInstance


    override func viewDidLoad() {
        super.viewDidLoad()
        store.getProductImages {
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
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
                return CGSize(width: 175, height: 400.0)
            }
}

    //Mark: Datasource
    extension ProductViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return store.products.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
            UICollectionViewCell {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
                
                let produkt = store.products[indexPath.row]
                cell.displayContent(image: store.images[indexPath.row], title: produkt.name, price: produkt.price)
                
                return cell
                
                
        }
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            let productDetailController = ProductDetailViewController()
            navigationController?.pushViewController(productDetailController, animated: true)
        }
}

