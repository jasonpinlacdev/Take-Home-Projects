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
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(_ meal: MTMeal) {
    MTNetworkManager.shared.getThumbnail(from: meal.thumbnailURL) { [weak self] result in
      DispatchQueue.main.async {
        self?.mealsBodyLabel.text = meal.name
        switch result {
        case .success(let thumbnailImage):
          self?.mealsThumbnailImageView.image = thumbnailImage
        case .failure(_):
          return
        }
      }
    }
  }
  
  
  private func configure() {
    self.accessoryType = .detailButton
    self.tintColor = .coralRed
    mealsBodyLabel.backgroundColor = .clear
//    mealsBodyLabel.textAlignment = .left
  }
  
  
  private func configureLayout() {
    let padding: CGFloat = 5.0
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
