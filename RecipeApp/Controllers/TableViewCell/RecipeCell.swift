//
//  RecipeCell.swift
//  RecipeApp
//
//  Created by Stuti on 26/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var icon: UIImageView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        view.roundCorners()
        icon.roundCorners()
    }
    
    func setRecipe(from recipe: Recipe?) {
        name.text = recipe?.title
        icon.getImage(from: recipe?.url)
    }
}
