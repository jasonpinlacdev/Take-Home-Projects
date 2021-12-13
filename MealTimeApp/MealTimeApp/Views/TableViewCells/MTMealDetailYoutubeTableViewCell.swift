//
//  MTMealDetailYoutubeTableViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit
import SafariServices

class MTMealDetailYoutubeTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: MTMealDetailYoutubeTableViewCell.self)
  weak var mealDetailController: MTMealDetailController?
  var youtubeURLString: String?
  
  let youtubeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Youtube", for: .normal)
    var buttonConfiguration = UIButton.Configuration.filled()
    buttonConfiguration.buttonSize = .large
    buttonConfiguration.baseBackgroundColor = .systemRed
    buttonConfiguration.baseForegroundColor = .white
    buttonConfiguration.image = MTSymbol.playFill.image
    buttonConfiguration.imagePadding = 10
    button.configuration = buttonConfiguration
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    youtubeButton.addTarget(self, action: #selector(youtubeButtonTapped), for: .touchUpInside)
  }
  
  
  @objc private func youtubeButtonTapped() {
    guard let mealDetailController = mealDetailController,
          let youtubeURLString = youtubeURLString,
          let youtubeURL = URL(string: youtubeURLString)
    else {
      mealDetailController?.presentAlert(error: .invalidYoutubeURL)
      return
    }
    let safariViewController = SFSafariViewController(url: youtubeURL)
    safariViewController.preferredControlTintColor = .coralRed
    mealDetailController.present(safariViewController, animated: true)
  }
  
  
  private func configureLayout() {
    self.contentView.addSubview(youtubeButton)
    NSLayoutConstraint.activate([
      youtubeButton.heightAnchor.constraint(equalTo:self.contentView.heightAnchor),
      youtubeButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      youtubeButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      youtubeButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
    ])
  }
  
}
