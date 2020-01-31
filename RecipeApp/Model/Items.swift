//
//  Items.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Items: Codable {
    let fields: Fields?
    
    private enum CodingKeys: String, CodingKey {
        case fields
    }
}
