//
//  ProductViewController.swift
//  Unit
//
//  Created by Siham Hadi on 2018-09-12.
//  Copyright © 2018 Unit. All rights reserved.

//
struct Product : Codable { //(types should be capitalized)
var name: String
var price: String//try the `URL` type! it's codable and much better than `String` for storing URLs
var imageUrl: URL?
    
    
    public enum CodingKeys: String, CodingKey { case name, price} //this is usually synthesized, but we have to define it ourselves to exclude `urlImage`
    
}
import UIKit
class ProductViewController:  UIViewController, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    //Mark : Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

var product = [Product]()


    override func viewDidLoad() {
        super.viewDidLoad()
    sideMenu()
    fetchJSON()
        
    
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
    
    // 
    fileprivate func fetchJSON() {
        let UrlString = "https://s3.amazonaws.com/jsondecode/products.json"
        
        guard let url = URL(string:UrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err //also perhaps check response status 200 OK
            
            guard let data = data else { return }
            
            do {
                let productItem =  try
                    JSONDecoder().decode([Product].self, from: data)
                self.product = productItem
        
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                
            }
            

            
            }.resume()
        
    }

    
    //MARK: - UICollectionViewDelegateFlowLayout
        
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
            {
                return CGSize(width: 175, height: 400.0)
            }

    //Mark: Datasource
 
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return product.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
            UICollectionViewCell {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
                let productInfo = product[indexPath.row]
    
                cell.productName.text = productInfo.name
                cell.rentprice.text = productInfo.price
              
                return cell
                
                
    }}
