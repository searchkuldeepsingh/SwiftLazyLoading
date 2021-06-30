//
//  AnimalResources.swift
//  SwiftLazyLoading
//
//  Created by Kuldeep on 30/06/21.
//

import Foundation

struct AnimalResources {
    
    func getAnimals(completionHandler: @escaping (AnimalResponse?) -> ()) {
        let animalApiUrl = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")!
       
        
        URLSession.shared.dataTask(with: animalApiUrl) { (data, response, error) in
            
            if(error == nil && data != nil) {
                do {
                    let result = try JSONDecoder().decode(AnimalResponse.self, from: data!)
                    
                    completionHandler(result)
                    
                } catch let error {
                    debugPrint(error)
                }
            }
        }.resume()
    }
}
