//
//  RecipeListVC.swift
//  RecipeApp
//
//  Created by Stuti on 26/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class RecipeListVC: UIViewController {
    
    //MARK:- Outlets and Properties
    @IBOutlet private weak var tblView: UITableView!
    private var recipeListVM = RecipeListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeListVM.uidelegate = self
        navigationItem.title = Key.Recipes
    }
}

//MARK:- UITableView Extensions
extension RecipeListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeListVM.getRecipeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String.getName(for: RecipeCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RecipeCell
        cell.setRecipe(from: recipeListVM.getRecipe(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = String.getName(for: RecipeDetailVC.self)
        if let recipeDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as? RecipeDetailVC {
            let selectedRecipe = recipeListVM.getRecipe(at: indexPath.row)
            recipeDetailVC.recipeDetailVM = RecipeDetailVM(with: selectedRecipe)
            navigationController?.pushViewController(recipeDetailVC, animated: true)
        }
    }
}

//MARK:- Custom Delegate Extensions
extension RecipeListVC: UIDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
    
    func show(message: String) {
        DispatchQueue.main.async {
            self.showAlert(with: message)
        }
    }
}
