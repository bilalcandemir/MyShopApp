//
//  ImageSliderTableViewCell.swift
//  MyShopApp
//
//  Created by Bilal Candemir on 8/27/22.
//

import UIKit

class ImageSliderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(){
        selectionStyle = .none
        accessoryType = .none
    }
    
}
