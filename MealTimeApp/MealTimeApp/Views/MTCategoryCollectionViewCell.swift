//
//  MTCategoryCollectionViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTCategoryCollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = String(describing: MTCategoryCollectionViewCell.self)
  
  let categoryThumbnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = MTSymbol.forkKnifePlaceholder.image
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 16
    imageView.layer.borderColor = UIColor.systemGray3.cgColor
//    imageView.layer.borderWidth = 1
    imageView.clipsToBounds = true
    imageView.tintColor = UIColor.systemGray3
    imageView.backgroundColor = UIColor.systemGray6
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let categoryLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byTruncatingTail
    label.textAlignment = .center
    label.text = "Placeholder"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configureLayout() {
    self.contentView.addSubview(categoryThumbnailImageView)
//    self.contentView.addSubview(categoryLabel)
    NSLayoutConstraint.activate([
      categoryThumbnailImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
      categoryThumbnailImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      categoryThumbnailImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      categoryThumbnailImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
    ])
  }
  
}
