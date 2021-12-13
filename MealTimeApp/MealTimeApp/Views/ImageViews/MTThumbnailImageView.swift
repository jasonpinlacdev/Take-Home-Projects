//
//  MTThumbnailImageView.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTThumbnailImageView: UIImageView {

  init() {
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.image = MTSymbol.forkKnifePlaceholder.image
    self.contentMode = .scaleAspectFill
    self.clipsToBounds = true
    self.tintColor = UIColor.systemGray3
    self.backgroundColor = UIColor.systemGray6
    self.layer.cornerRadius = 5
    self.clipsToBounds = true
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
