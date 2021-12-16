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
  
  
  
  // adding the urlString to guard on it is important.
  // becuase if we scroll through the tableView/collectionView fast, we are making a bunch of async calls that are running in the background.
  // Even with prepareforreuse we wont know which will end last IE the prepareForReuse or the async call to get the image and assign it to the imageview as the result. With this being the case, we can cancel the async operation but this might be tricky because we dont know the exact timing of when it ends and it complete before we cancel.
  // So instead, what we do is we check the last url for the image set to this cell as a stored property... IE mostRecentThumbnailURLSet... and check it against the return of all the async calls previously called(called because we scrolled fast) result IE a tuple of the (image, urlString).
  // Now, if they are a match then we set, if not we just return. The biggest improvement is we skip the glitch affect from the tableview/collectionview cell's image when scrolling fast and having a slow/fast connection.
  // case .success(let thumbnailImage, let urlString):
  // guard urlString == mostRecentThumbnailURLSet { else return }
  func set(_ category: MTCategory) {
    self.categoryBodyLabel.text = category.name
    
    self.mostRecentThumbnailURLSet = category.thumbnailURL
    MTNetworkManager.shared.getThumbnail(from: category.thumbnailURL) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.main.async {
        switch result {
        case .success( (let thumbnailImage, let thumbnailURL) ):
          guard thumbnailURL == self.mostRecentThumbnailURLSet else { print("The thumbnail URL's are not equal. Returning before setting the image"); return }
          self.categoryThumbnailImageView.image = thumbnailImage
        case .failure(_):
          return
        }
      }
    }
  }
  
  
  // this improved set in an improved implementation on the tableView/collectionView image setting bug when scrolling fast on a slow connection.
  // we simply just cancel any previous network calls using the URLSession.shared.dataTask() instance returned.
  // this makes sense because as we scroll, call the cellForRowItemAt, dequeue a cell, and set the thumbnail URLString for the network call to hit the API
  // we don't care about any previous network calls to get the image thumbnail data. We only want the most recent thumbnail image from the most recent network request.
  // So, we keep track of the previous dataTask doing the network call, stop it and track the new dataTask.
  func improvedSet(_ category: MTCategory) {
    self.categoryBodyLabel.text = category.name
    
    self.currentDataTask?.cancel()
    self.currentDataTask = MTNetworkManager.shared.improvedGetThumbnail(from: category.thumbnailURL) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.main.async {

        switch result {
        case .success( let thumbnailImage ):
          self.categoryThumbnailImageView.image = thumbnailImage
        case .failure(_):
          return
        }
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
