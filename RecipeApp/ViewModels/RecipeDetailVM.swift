//
//  RecipeDetailVM.swift
//  RecipeApp
//
//  Created by Stuti on 26/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

class RecipeDetailVM {
    
    //MARK:- Properties
    private var selectedRecipe: Recipe?
    
    //MARK:- Methods
    init(with selectedRecipe: Recipe?) {
        self.selectedRecipe = selectedRecipe
    }
    
    func getImage() -> URL? {
        return selectedRecipe?.url
    }
    
    func getRecipeInfo(for index: Int) -> (String, String?) {
        switch index {
        case RecipeDetail.title.rawValue:
            return (RecipeDetail.title.headerTitle, selectedRecipe?.title)
        case RecipeDetail.description.rawValue:
            return (RecipeDetail.description.headerTitle, selectedRecipe?.description)
        case RecipeDetail.calories.rawValue:
            return (RecipeDetail.calories.headerTitle, "\(selectedRecipe?.calories ?? 0) \(Key.Calories)")
        default:
            return ("", "")
        }
    }
}
