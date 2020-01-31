//
//  LabelCell.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var headerLbl: UILabel!
    @IBOutlet private weak var lbl: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setRecipe(_ headerTitle: String, and title: String?) {
        headerLbl.text = headerTitle
        lbl.text = title
    }
}
