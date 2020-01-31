//
//  Extensions.swift
//  RecipeApp
//
//  Created by Stuti on 30/01/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

//MARK:- UIViewController Extensions
extension UIViewController {
    func showAlert(with message: String) {
        let alertVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Key.OK, style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

//MARK:- UIImageView Extensions
extension UIImageView {
    func getImage(from url: URL?) {
        guard let url = url else { return }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            set(cachedImage)
        } else {
            let request = ApiManager.shared.createRequest(url: url, method: .get)
            ApiManager.shared.fetch(request: request) { (data, error) in
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                self.set(image)
            }
        }
    }
    
    private func set(_ image: UIImage) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}

//MARK:- String Extensions
extension String {
    static func getName(for className: Any) -> String {
        return "\(className)"
    }
}

//MARK:- UIView Extensions
extension UIView {
    func roundCorners() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
}
