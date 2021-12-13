//
//  MTMealDetailIngredientsTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailIngredientTableViewCell: UITableViewCell {

  static let reuseIdentifier = String(describing: MTMealDetailIngredientTableViewCell.self)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    
  }
  
  private func configureLayout() {
    
  }

}
