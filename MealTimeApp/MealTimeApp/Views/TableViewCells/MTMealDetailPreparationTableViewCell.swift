//
//  MTMealDetailPreparationTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailPreparationTableViewCell: UITableViewCell {

  static let reuseIdentifier = String(describing: MTMealDetailPreparationTableViewCell.self)
  
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
