//
//  ImageCell.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var imgView: UIImageView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setRecipeImage(with imageURL: URL?) {
        imgView.getImage(from: imageURL)
    }
}
