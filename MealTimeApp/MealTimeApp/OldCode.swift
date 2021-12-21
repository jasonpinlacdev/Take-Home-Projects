//
//  OldCode.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/21/21.
//

import Foundation


//  func getThumbnail(from urlString: String, completionHandler: @escaping (Result<(UIImage, String), MTNetworkingError>) -> Void) {
//    guard let url = URL(string: urlString) else { completionHandler(.failure(.invalidURL)); return }
//    let thumbNailImageCacheKey = NSString(string: urlString)
//    if let thumnailImage = self.thumbnailImageCache.object(forKey: thumbNailImageCacheKey) {
//      completionHandler(.success( (thumnailImage, urlString) ))
//    }
//    else {
//      let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//        guard error == nil else { completionHandler(.failure(.localError)); return }
//        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
//        guard let thumbnailData = data else { completionHandler(.failure(.dataError)); return }
//        guard let thumbnailImage = UIImage(data: thumbnailData) else { completionHandler(.failure(.dataDecodingError)); return }
//        self?.thumbnailImageCache.setObject(thumbnailImage, forKey: thumbNailImageCacheKey)
//        completionHandler(.success( (thumbnailImage, urlString) ))
//      }
//      task.resume()
//    }
//  }


//  // adding the urlString to guard on it is important.
//  // becuase if we scroll through the tableView/collectionView fast, we are making a bunch of async calls that are running in the background.
//  // Even with prepareforreuse we wont know which will end last IE the prepareForReuse or the async call to get the image and assign it to the imageview as the result. With this being the case, we can cancel the async operation but this might be tricky because we dont know the exact timing of when it ends and it complete before we cancel.
//  // So instead, what we do is we check the last url for the image set to this cell as a stored property... IE mostRecentThumbnailURLSet... and check it against the return of all the async calls previously called(called because we scrolled fast) result IE a tuple of the (image, urlString).
//  // Now, if they are a match then we set, if not we just return. The biggest improvement is we skip the glitch affect from the tableview/collectionview cell's image when scrolling fast and having a slow/fast connection.
//  // case .success(let thumbnailImage, let urlString):
//  // guard urlString == mostRecentThumbnailURLSet { else return }
//  func set(_ category: MTCategory) {
//    self.categoryBodyLabel.text = category.name
//
//    self.mostRecentThumbnailURLSet = category.thumbnailURL
//    MTNetworkManager.shared.getThumbnail(from: category.thumbnailURL) { [weak self] result in
//      guard let self = self else { return }
//      DispatchQueue.main.async {
//        switch result {
//        case .success( (let thumbnailImage, let thumbnailURL) ):
//          guard thumbnailURL == self.mostRecentThumbnailURLSet else { print("The thumbnail URL's are not equal. Returning before setting the image"); return }
//          self.categoryThumbnailImageView.image = thumbnailImage
//        case .failure(_):
//          return
//        }
//      }
//    }
//  }


////adding the urlString to guard on it is important.
////becuase if we scroll through the tableView/collectionView fast, we are making a bunch of async calls that are running in the background.
////Even with prepareforreuse we wont know which will end last IE the prepareForReuse or the async call to get the image and assign it to the imageview as the result. With this being the case, we can cancel the async operation but this might be tricky because we dont know the exact timing of when it ends and it complete before we cancel.
////So instead, what we do is we check the last url for the image set to this cell as a stored property... IE mostRecentThumbnailURLSet... and check it against the return of all the async calls previously called(called because we scrolled fast) result IE a tuple of the (image, urlString).
////Now, if they are a match then we set, if not we just return. The biggest improvement is we skip the glitch affect from the tableview/collectionview cell's image when scrolling fast and having a slow/fast connection.
////case .success(let thumbnailImage, let urlString):
////guard urlString == mostRecentThumbnailURLSet { else return }
//  func set(_ meal: MTMeal) {
//    self.mealsBodyLabel.text = meal.name
//
//    self.mostRecentThumbnailURLSet = meal.thumbnailURL
//    MTNetworkManager.shared.getThumbnail(from: meal.thumbnailURL) { [weak self] result in
//      guard let self = self else { return }
//      DispatchQueue.main.async {
//        switch result {
//
//        case .success( (let thumbnailImage, let thumbnailURL) ):
//          guard thumbnailURL == self.mostRecentThumbnailURLSet else { print("NOT EQUAL"); return }
//          self.mealsThumbnailImageView.image = thumbnailImage
//        case .failure(_):
//          return
//        }
//      }
//    }
//  }
