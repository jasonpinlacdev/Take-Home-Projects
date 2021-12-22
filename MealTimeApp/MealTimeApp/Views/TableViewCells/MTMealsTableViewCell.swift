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

  var currentDataTask: URLSessionDataTask?
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  // this set method sets sets the category name to the the label and also invokes a network call to download the thumbnail data and set it.
  // Also, we set the dataTask reference to a stored property on the cell called currentDataTask. This is to hold a reference to the last network call invoked.
  // reason being is because we dont want a user wasting their data on network calls that run async in the background
  // we simply just cancel any previous network calls using the URLSession.shared.dataTask() instance returned in the prepareForReuse method below.
  // this makes sense because as we scroll, call the cellForRowItemAt, dequeue a cell, and set the thumbnail URLString for the network call to hit the API
  // we don't care about any previous network calls to get the image thumbnail data. We only want the most recent thumbnail image from the most recent network request.
  // So, we keep track of the previous dataTask doing the network call, stop it and track the new dataTask.
  func set(_ meal: MTMeal) {
    self.mealsBodyLabel.text = meal.name
    self.currentDataTask = MTNetworkManager.shared.getThumbnail(from: meal.thumbnailURL) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success( let thumbnailImage ):
        DispatchQueue.main.async { self.mealsThumbnailImageView.image = thumbnailImage }
      case .failure(_):
        return
      }
    }
  }
  
  
  func resetToPlaceholderState() {
    self.mealsThumbnailImageView.image = MTSymbol.forkKnifePlaceholder.image
    self.mealsBodyLabel.text = "Placeholder"
  }
  
  
  // This function is called within cellForRow/Item at. Its responsibility is to cancel the previous network call/dataTask to get the thumbnail image data.
  func cancelThumbnailImageRequest() {
    self.currentDataTask?.cancel()
  }
  
  
  // this prepareForReuse is important on fixing that image glitch when scrolling fast on a slow connection.
  // Because getting the images is from an async call we dont know the exact timeing...
  // this can cause images to populate the imageView on the cell slow and this means that the image from the last cell dequeue could still be there and not be in sync with other information on the cell set IE the label.
  // So, we prepare the cell for reuse by canceling the previous async datatask to get the thumbnail data as we scroll cells off the screen and get ready to dequeue them.
  // This ensures ONLY the very last network dataTask call to get the thumbnail is not canceled and will set when done. Every other previous async call made will cancel as we scroll off, prepare, and dequeue reusable cells.
//  override func prepareForReuse() {
//    super.prepareForReuse()
//    self.currentDataTask?.cancel()
//  }
  
  
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
