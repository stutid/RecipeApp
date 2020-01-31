//
//  File.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct File: Codable {
    let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case url
    }
}
