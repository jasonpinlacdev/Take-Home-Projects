//
//  MTMealDetailBannerTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailBannerTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: MTMealDetailBannerTableViewCell.self)
  
  let bannerImageView = MTThumbnailImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(thumbnailUrlString: String) {
    MTNetworkManager.shared.getThumbnail(from: thumbnailUrlString) { [weak self] result in
      switch result {
      case .success(let thumbnailImage):
        DispatchQueue.main.async {
          self?.bannerImageView.image = thumbnailImage
        }
      case.failure(_):
        return
      }
    }
  }
  
  private func configureLayout() {
    self.contentView.addSubview(bannerImageView)
    NSLayoutConstraint.activate([
      bannerImageView.heightAnchor.constraint(equalTo:self.contentView.heightAnchor),
      bannerImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      bannerImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      bannerImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
    ])
  }
  
}
