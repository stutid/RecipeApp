//
//  Photo.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let sys: Sys?
    
    private enum CodingKeys: String, CodingKey {
        case sys
    }
}
