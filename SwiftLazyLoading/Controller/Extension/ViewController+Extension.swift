//
//  ViewControllerExtension.swift
//  SwiftLazyLoading
//
//  Created by Kuldeep on 30/06/21.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.animal?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath) as? AnimalTableCell else {
            return UITableViewCell()
        }
        
        let animal = self.animal?[indexPath.row]
        cell.lblName.text = animal?.name

        let animalImageUrl = URL(string: (animal?.image)!)!
        cell.imgAnimal.loadImage(fromUrl: animalImageUrl, placeholderImage: "")
        
        return cell
    }
}
