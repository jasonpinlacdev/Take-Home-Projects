//
//  MTCategoryCollectionViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTCategoryCollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = String(describing: MTCategoryCollectionViewCell.self)
  
  lazy var categoryThumbnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = MTSymbol.forkKnifePlaceholder.image
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = (self.contentView.bounds.height * 0.85)/2
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
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .systemBackground
    return label
  }()
  
  
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
        self?.categoryLabel.text = category.name
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
    self.contentView.addSubview(categoryLabel)
    NSLayoutConstraint.activate([
      categoryThumbnailImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
      categoryThumbnailImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      categoryThumbnailImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      categoryThumbnailImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      categoryLabel.bottomAnchor.constraint(equalTo: categoryThumbnailImageView.bottomAnchor),
      categoryLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.12),
      categoryLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      categoryLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
    ])
  }
  
}
