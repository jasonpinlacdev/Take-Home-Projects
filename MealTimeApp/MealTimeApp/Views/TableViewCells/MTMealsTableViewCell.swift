//
//  MTMealsTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealsTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: MTMealsTableViewCell.self)
  
  let mealsThumbnailImageView = MTThumbnailImageView()
  let mealsBodyLabel = MTBodyLabel()
  
  var mostRecentThumbnailURLSet: String = ""
  
  var currentDataTask: URLSessionDataTask?
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
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
  
  // this improved set in an improved implementation on the tableView/collectionView image setting bug when scrolling fast on a slow connection.
  // we simply just cancel any previous network calls using the URLSession.shared.dataTask() instance returned.
  // this makes sense because as we scroll, call the cellForRowItemAt, dequeue a cell, and set the thumbnail URLString for the network call to hit the API
  // we don't care about any previous network calls to get the image thumbnail data. We only want the most recent thumbnail image from the most recent network request.
  // So, we keep track of the previous dataTask doing the network call, stop it and track the new dataTask.
  func improvedSet(_ meal: MTMeal) {
    self.mealsBodyLabel.text = meal.name
    
    self.currentDataTask?.cancel()
    self.currentDataTask = MTNetworkManager.shared.improvedGetThumbnail(from: meal.thumbnailURL) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.main.async {
        switch result {
        case .success( let thumbnailImage ):
          self.mealsThumbnailImageView.image = thumbnailImage
        case .failure(_):
          return
        }
      }
    }
  }
  
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.mealsThumbnailImageView.image = MTSymbol.forkKnifePlaceholder.image
    self.mealsBodyLabel.text = "Placeholder"
  }
  
  
  private func configure() {
    self.accessoryType = .detailDisclosureButton
    self.tintColor = .coralRed
    mealsBodyLabel.backgroundColor = .clear
    mealsBodyLabel.font = UIFont.preferredFont(forTextStyle: .title3)
  }
  
  
  private func configureLayout() {
    let padding: CGFloat = 10.0
    self.contentView.addSubview(mealsThumbnailImageView)
    self.contentView.addSubview(mealsBodyLabel)
    NSLayoutConstraint.activate([
      mealsThumbnailImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
      mealsThumbnailImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -padding),
      mealsThumbnailImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
      mealsThumbnailImageView.widthAnchor.constraint(equalTo: mealsThumbnailImageView.heightAnchor),
      mealsBodyLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
      mealsBodyLabel.leadingAnchor.constraint(equalTo: mealsThumbnailImageView.trailingAnchor, constant: padding),
      mealsBodyLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      mealsBodyLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding)
    ])
  }
  
}
