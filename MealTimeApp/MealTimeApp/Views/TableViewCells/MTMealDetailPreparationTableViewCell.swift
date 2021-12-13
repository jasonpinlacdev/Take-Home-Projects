//
//  MTMealDetailPreparationTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailPreparationTableViewCell: UITableViewCell {

  static let reuseIdentifier = String(describing: MTMealDetailPreparationTableViewCell.self)
  
  let preparationLabel = MTMealDetailLabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(preparation: String) {
    self.preparationLabel.text = preparation
  }
  
  private func configure() {
    self.preparationLabel.numberOfLines = 0
    self.preparationLabel.textAlignment = .left
  }

  private func configureLayout() {
    let padding: CGFloat = 5
    self.contentView.addSubview(preparationLabel)
    NSLayoutConstraint.activate([
      self.preparationLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
      self.preparationLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
      self.preparationLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
      self.preparationLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -padding),
    ])
  }
}
