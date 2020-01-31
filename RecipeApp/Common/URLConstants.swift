//
//  URLConstants.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
enum URLConstants {
    private static let BASE_URL = "https://cdn.contentful.com"
    private static let SPACE_ID = "kk2bw5ojx476"
    private static let ACCESS_TOKEN = "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c"
    case getRecipes, getImage(String)
    
    var url: URL? {
        return URL(string: "\(URLConstants.BASE_URL)\(endPoint)")
    }
    
    var imageURL: URL? {
        return URL(string: "https:\(endPoint)")
    }
    
    private var endPoint: String {
        switch self {
        case .getRecipes:
            return "/spaces/\(URLConstants.SPACE_ID)/environments/master/entries?access_token=\(URLConstants.ACCESS_TOKEN)"
        case .getImage(let url):
            return "\(url)"
        }
    }
}

enum HTTPMethod {
    case get
    
    var type: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
