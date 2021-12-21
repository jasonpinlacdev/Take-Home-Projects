//
//  MTCategoryCollectionViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTCategoryCollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = String(describing: MTCategoryCollectionViewCell.self)
  
  let categoryThumbnailImageView = MTThumbnailImageView()
  let categoryBodyLabel = MTBodyLabel()
  
  var mostRecentThumbnailURLSet: String = ""

  var currentDataTask: URLSessionDataTask?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  

  
  
  // this improved set in an improved implementation on the tableView/collectionView image setting bug when scrolling fast on a slow connection.
  // reason being is because we dont want a user wasting their data on network calls that run async in the background
  // we simply just cancel any previous network calls using the URLSession.shared.dataTask() instance returned.
  // this makes sense because as we scroll, call the cellForRowItemAt, dequeue a cell, and set the thumbnail URLString for the network call to hit the API
  // we don't care about any previous network calls to get the image thumbnail data. We only want the most recent thumbnail image from the most recent network request.
  // So, we keep track of the previous dataTask doing the network call, stop it and track the new dataTask.
  func improvedSet(_ category: MTCategory) {
    self.categoryBodyLabel.text = category.name
    
    self.currentDataTask?.cancel()
    self.currentDataTask = MTNetworkManager.shared.getThumbnail(from: category.thumbnailURL) { [weak self] result in
      guard let self = self else { return }
        switch result {
        case .success( let thumbnailImage ):
          DispatchQueue.main.async { self.categoryThumbnailImageView.image = thumbnailImage }
        case .failure(_):
          return
        }

    }
  }
  
  
  
  // this prepareForReuse is important on fixing that image glitch when scrolling fast on a slow connection.
  // Because getting the images is from an async call we dont know the exact timeing...
  // this can cause images to populate the imageView on the cell slow and this means that the image from the last cell dequeue could still be there and not be in sync with other information on the cell set IE the label.
  // So, we prepare the cell for reuse by resetting the cell's data back to a placeholder state as soon as it is scrolled off the screen so its a fresh canvas when it is dequeued for reuse and ready to be populated with appropriate data.
  override func prepareForReuse() {
    super.prepareForReuse()
    self.categoryThumbnailImageView.image = MTSymbol.forkKnifePlaceholder.image
    self.categoryBodyLabel.text = "Placeholder"
  }
  
  
  private func configureLayout() {
    self.contentView.addSubview(categoryThumbnailImageView)
    self.contentView.addSubview(categoryBodyLabel)
    NSLayoutConstraint.activate([
      categoryThumbnailImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
      categoryThumbnailImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      categoryThumbnailImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      categoryThumbnailImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      categoryBodyLabel.bottomAnchor.constraint(equalTo: categoryThumbnailImageView.bottomAnchor),
      categoryBodyLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.15),
      categoryBodyLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      categoryBodyLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
    ])
  }

}
