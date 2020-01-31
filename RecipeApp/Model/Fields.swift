//
//  Fields.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Fields: Codable {
    let title: String?
    let description: String?
    let calories: Int?
    let photo: Photo?
    let file: File?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case calories
        case photo
        case file
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try? container.decode(String.self, forKey: .title)
        description = try? container.decode(String.self, forKey: .description)
        calories = try? container.decode(Int.self, forKey: .calories)
        photo = try? container.decode(Photo.self, forKey: .photo)
        file = try? container.decode(File.self, forKey: .file)
    }
}
