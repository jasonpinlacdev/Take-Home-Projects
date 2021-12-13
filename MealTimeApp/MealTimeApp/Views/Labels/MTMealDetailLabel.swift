//
//  MTMealDetailLabel.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailLabel: UILabel {

  init() {
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .systemGray4
    self.layer.cornerRadius = 5
    self.textAlignment = .center
    self.clipsToBounds = true
  }

}
