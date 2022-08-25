//
//  ProductCell.swift
//  MyShopApp
//
//  Created by Bilal Candemir on 8/25/22.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCell(item:Mock){
        productNameLabel.text = item.productName
        productPriceLabel.text = "\(item.productPrice) TL"
    }
    
}
