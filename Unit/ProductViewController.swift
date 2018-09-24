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
var imageUrl: String

    
    init (name:String, price: String, imageUrl: String) {
        self.name = name
        self.price = price
        self.imageUrl = imageUrl
    }
    
}

struct  ProductImage {
var imageUrl: UIImage
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
    
    // seuge
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailvc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailTableViewController")
            as? ProductDetailTableViewController
        let productInfo = product[indexPath.row]
        detailvc?.name = productInfo.name
        detailvc?.price = productInfo.price
        
        if let productImage = URL (string: product[indexPath.row].imageUrl) {
           
                let data = try? Data (contentsOf: productImage)
                if let data = data {
                    let imagedetail = UIImage (data: data)
                    
                         detailvc?.image = imagedetail!
                    }
                }
        self.navigationController?.pushViewController(detailvc!, animated: true)
    
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
                
                if let productImage = URL (string: product[indexPath.row].imageUrl) {
                    DispatchQueue.global().async {
                        let data = try? Data (contentsOf: productImage)
                        if let data = data {
                            let imageUrl = UIImage (data: data)
                            DispatchQueue.main.async {
                                
                                cell.imageView.image = imageUrl
                                
                            }
                    }
                    
                    }
                }
             
                return cell
                
                
                
    }
}

