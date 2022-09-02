//
//  SliderCollectionViewCell.swift
//  MyShopApp
//
//  Created by Bilal Candemir on 8/27/22.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //imageView.layer.cornerRadius = 5
        self.layer.cornerRadius = 10
    }
    
    func setCell(_ item: CollectionViewMock){
        imageView.image = UIImage(named: item.imageName)
        labelDescription.text = item.description
        
    }

}
