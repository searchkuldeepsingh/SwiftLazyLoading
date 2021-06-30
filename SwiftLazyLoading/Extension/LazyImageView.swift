//
//  LazyImageView.swift
//  SwiftLazyLoading
//
//  Created by Kuldeep on 30/06/21.
//

import UIKit

class LazyImageView: UIImageView {
    
    private let imageCache = NSCache<AnyObject,UIImage>()
    
    func loadImage(fromUrl imageUrl: URL, placeholderImage: String)  {
        self.image = UIImage(named: placeholderImage)
        
        if let cachedImage = self.imageCache.object(forKey: imageUrl as AnyObject) {
            debugPrint("image loaded from cache for =\(imageUrl)")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            
            if let imageData = try? Data(contentsOf: imageUrl){
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.imageCache.setObject(image, forKey: imageUrl as AnyObject)
                        
                        self?.image = image
                    }
                }
            }
        }
    }
}
