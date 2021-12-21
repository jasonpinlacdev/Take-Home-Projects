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
  

  // this improved set in an improved implementation on the tableView/collectionView image setting bug when scrolling fast on a slow connection.
  // we simply just cancel any previous network calls using the URLSession.shared.dataTask() instance returned.
  // this makes sense because as we scroll, call the cellForRowItemAt, dequeue a cell, and set the thumbnail URLString for the network call to hit the API
  // we don't care about any previous network calls to get the image thumbnail data. We only want the most recent thumbnail image from the most recent network request.
  // So, we keep track of the previous dataTask doing the network call, stop it and track the new dataTask.
  func improvedSet(_ meal: MTMeal) {
    self.mealsBodyLabel.text = meal.name
    
    self.currentDataTask?.cancel()
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
