//
//  RecipeDetailVC.swift
//  RecipeApp
//
//  Created by Stuti on 26/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {
    
    //MARK:- Outlets and Properties
    @IBOutlet private weak var tblView: UITableView!
    var recipeDetailVM: RecipeDetailVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- UITableView Extensions
extension RecipeDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeDetail.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == RecipeDetail.image.rawValue {
            let identifier = String.getName(for: ImageCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ImageCell
            cell.setRecipeImage(with: recipeDetailVM.getImage())
            return cell
        } else {
            let identifier = String.getName(for: LabelCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LabelCell
            let (header, title) = recipeDetailVM.getRecipeInfo(for: indexPath.row)
            cell.setRecipe(header, and: title)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == RecipeDetail.image.rawValue {
            return 300
        }
        return UITableView.automaticDimension
    }
}
