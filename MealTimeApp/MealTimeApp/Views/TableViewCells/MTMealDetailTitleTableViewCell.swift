//
//  MTMealDetailTitleTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailTitleTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: MTMealDetailTitleTableViewCell.self)
  let titleLabel = MTTitleLabel()
  

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(title: String) {
    self.titleLabel.text = title
  }
  
  
  private func configure() {
    self.contentView.backgroundColor = .systemBackground
  }
  
  
  private func configureLayout() {
    self.contentView.addSubview(self.titleLabel)
    NSLayoutConstraint.activate([
      self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 25),
      self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
      self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
      self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
    ])
  }
  
}
