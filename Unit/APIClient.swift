//
//  APIClient.swift
//  
//
//  Created by Siham Hadi on 2018-09-16.
//

import Foundation


typealias ProductsJSON = [String: Any]

struct APIClient {
    
    static func getProductsApi(completion: @escaping (ProductsJSON?) -> Void) {
        
        let url = URL (string: "https://s3.amazonaws.com/unitimg/products.json")
        let session = URLSession.shared
        
        guard let unrappedURL = url else  {print("Error unwrapping data"); return}
        
        let dataTask = session.dataTask(with: unrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else  {print("Error unwrapping data"); return}
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as?
                ProductsJSON
                
                completion (responseJSON)
            } catch {
                
                print( "Could not get API data.\(error), \(error.localizedDescription)")
                
            }
        }
        dataTask.resume()
        
}
}
