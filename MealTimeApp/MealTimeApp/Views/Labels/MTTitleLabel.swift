//
//  MTitleLabel.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTTitleLabel: UILabel {

  init() {
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.numberOfLines = 0
    self.adjustsFontSizeToFitWidth = true
    self.minimumScaleFactor = 0.9
    self.text = "Placeholder"
    self.textAlignment = .center
    self.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    self.translatesAutoresizingMaskIntoConstraints = false
  }


}
