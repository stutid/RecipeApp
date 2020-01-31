//
//  Constants.swift
//  RecipeApp
//
//  Created by Stuti on 26/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

enum Key {
    static let OK = "OK"
    static let Calories = "calories"
    static let Recipes = "Recipes"
    static let RecipeName = "Recipe Name"
    static let Description = "Description"
    static let CaloriesCount = "Calories Count"
}

enum RecipeDetail: Int, CaseIterable {
    case image, title, description, calories
    
    var headerTitle: String {
        switch self {
        case .title:
            return Key.RecipeName
        case .description:
            return Key.Description
        case .calories:
            return Key.CaloriesCount
        default:
            return ""
        }
    }
}
