//
//  AnimalTableCell.swift
//  SwiftLazyLoading
//
//  Created by Kuldeep on 30/06/21.
//

import UIKit

class AnimalTableCell: UITableViewCell {

    @IBOutlet weak var imgAnimal: LazyImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
