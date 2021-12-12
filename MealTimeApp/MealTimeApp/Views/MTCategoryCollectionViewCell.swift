//
//  MTCategoryCollectionViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTCategoryCollectionViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = String(describing: MTCategoryCollectionViewCell.self)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.backgroundColor = .systemBlue
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
