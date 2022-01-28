//
//  MTImageService.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 1/27/22.
//

import UIKit


final class MTImageService {
    
    static private let thumbnailImageCache = NSCache<NSString, UIImage>()
    
    var urlSession: URLSessionRepresentable = URLSession.shared
    
    func getThumbnail(from urlString: String, completionHandler: @escaping (Result<(UIImage), MTNetworkingError>) -> Void) -> Cancellable? {
        guard let url = URL(string: urlString) else { completionHandler(.failure(.invalidURL)); return nil }
        let thumbNailImageCacheKey = NSString(string: urlString)
        if let thumnailImage = MTImageService.thumbnailImageCache.object(forKey: thumbNailImageCacheKey) {
            completionHandler(.success(thumnailImage))
            return nil
        }
        else {
            let task = urlSession.dataTask(with: url) { data, response, error in
                guard error == nil else { completionHandler(.failure(.localError)); return }
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
                guard let thumbnailData = data else { completionHandler(.failure(.dataError)); return }
                guard let thumbnailImage = UIImage(data: thumbnailData) else { completionHandler(.failure(.dataDecodingError)); return }
                MTImageService.thumbnailImageCache.setObject(thumbnailImage, forKey: thumbNailImageCacheKey)
                completionHandler(.success(thumbnailImage))
            }
            task.resume()
            return task
        }
    }
    
}
