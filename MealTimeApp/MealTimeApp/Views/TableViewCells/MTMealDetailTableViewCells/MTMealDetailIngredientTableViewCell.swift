//
//  MTMealDetailIngredientsTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailIngredientTableViewCell: UITableViewCell {

  static let reuseIdentifier = String(describing: MTMealDetailIngredientTableViewCell.self)
  let ingredientLabel = MTMealDetailLabel()
  let measurementLabel = MTMealDetailLabel()
  
  let horizontalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(ingredientAndMeasurement: (ingredient: String, measurement: String)) {
    self.ingredientLabel.text = ingredientAndMeasurement.ingredient
    self.measurementLabel.text = ingredientAndMeasurement.measurement
  }
  
  
  private func configureLayout() {
    let padding: CGFloat = 5
    horizontalStackView.addArrangedSubview(ingredientLabel)
    horizontalStackView.addArrangedSubview(measurementLabel)
    self.contentView.addSubview(horizontalStackView)
    NSLayoutConstraint.activate([
      self.horizontalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
      self.horizontalStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
      self.horizontalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
      self.horizontalStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -padding),
    ])
  }

}
