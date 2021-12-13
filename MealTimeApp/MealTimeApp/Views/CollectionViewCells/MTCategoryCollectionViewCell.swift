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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(_ category: MTCategory) {
    MTNetworkManager.shared.getThumbnail(from: category.thumbnailURL) { [weak self] result in
      DispatchQueue.main.async {
        self?.categoryBodyLabel.text = category.name
        switch result {
        case .success(let thumbnailImage):
          self?.categoryThumbnailImageView.image = thumbnailImage
        case .failure(_):
          return
        }
      }
    }
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
