//
//  MTBodyLabel.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTBodyLabel: UILabel {
  
  init() {
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.numberOfLines = 0
    self.lineBreakMode = .byTruncatingTail
    self.text = "Placeholder"
    self.font = UIFont.preferredFont(forTextStyle: .body)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .systemBackground
  }

  
}
