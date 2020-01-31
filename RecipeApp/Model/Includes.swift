//
//  Includes.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Includes: Codable {
    let asset: [Asset]?
    
    private enum CodingKeys: String, CodingKey {
        case asset = "Asset"
    }
}
