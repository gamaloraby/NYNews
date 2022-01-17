//
//  Utils.swift
//  NYNews
//
//  Created by gamal oraby on 15/01/2022.
//

import Foundation
import SDWebImage

extension UIImageView {

    func load(the urlString: String, placeholderImage: UIImage? = nil, completionBlock: @escaping (() -> Void)  = {  }) {
        var correctUrl = urlString
        if correctUrl.contains(" ") {
            correctUrl = correctUrl.replacingOccurrences(of: " ", with: "%20")
        }
        let url = URL(string: correctUrl)
        
        if let cachedImage = SDImageCache.shared.imageFromCache(forKey: correctUrl) {
            image = cachedImage
            completionBlock()
        } else {
            self.sd_setImage(with: url,
                                  placeholderImage: placeholderImage,
                                  options: [.retryFailed],
                                  context: [:],
                                  progress: .none) { (_, error, _, _) in
                if error != nil {
                   // handel error
                } else {
                  completionBlock()
                }
            }
        }
    }
}
