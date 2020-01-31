//
//  RecipeListVM.swift
//  RecipeApp
//
//  Created by Stuti on 26/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

class RecipeListVM {
    
    //MARK:- Properties
    private let apiManager = ApiManager.shared
    private var recipes = [Recipe]()
    weak var uidelegate: UIDelegate?
    
    //MARK:- Methods
    init() {
        fetchRecipeList()
    }
    
    func getRecipeCount() -> Int {
        return recipes.count
    }
    
    func getRecipe(at index: Int) -> Recipe? {
        return recipes[index]
    }
    
    private func fetchRecipeList() {
        let url = URLConstants.getRecipes.url
        let request = apiManager.createRequest(url: url, method: .get)
        apiManager.fetch(request: request) { (data, error) in
            guard let data = data else { return }
            do {
                var items = [Items]()
                var assets = [Asset]()
                let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                if let recipeItems = recipes.items {
                    items = self.filter(recipeItems)
                }
                if let recipeAssets = recipes.includes?.asset {
                    assets = recipeAssets
                }
                self.match(items, with: assets)
            } catch {
                self.uidelegate?.show(message: error.localizedDescription)
            }
        }
    }
    
    private func filter(_ items: [Items]) -> [Items] {
        return items.filter { $0.fields?.title != nil }
    }
    
    private func match(_ items: [Items], with assets: [Asset]) {
        for item in items {
            for asset in assets {
                if item.fields?.photo?.sys?.id == asset.sys?.id {
                    let title = item.fields?.title
                    let url = createImageURL(for: asset.fields?.file?.url)
                    let description = item.fields?.description
                    let calories = item.fields?.calories
                    let recipe = Recipe(title: title, url: url, description: description, calories: calories)
                    self.recipes.append(recipe)
                }
            }
        }
        self.uidelegate?.updateUI()
    }
    
    private func createImageURL(for url: String?) -> URL? {
        guard let url = url else { return nil }
        return URLConstants.getImage(url).imageURL
    }
}
