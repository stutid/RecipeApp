//
//  Recipe.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Recipes: Codable {
    let items: [Items]?
    let includes: Includes?
    
    private enum CodingKeys: String, CodingKey {
        case items
        case includes
    }
}

struct Recipe {
    let title: String?
    let url: URL?
    let description: String?
    let calories: Int?
}
