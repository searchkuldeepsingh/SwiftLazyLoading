//
//  ViewController.swift
//  SwiftLazyLoading
//
//  Created by Kuldeep on 30/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var animal: [Animal]? = nil
    let animalResource: AnimalResources = AnimalResources()
    
    @IBOutlet weak var tblAnimalList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        animalResource.getAnimals { (result) in
            if (result?.animals != nil) {
                
                self.animal = result?.animals
                
                DispatchQueue.main.async {
                    self.tblAnimalList.reloadData()
                }
            }
        }
    }
}

