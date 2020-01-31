//
//  Sys.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Sys: Codable {
    let id: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
    }
}
