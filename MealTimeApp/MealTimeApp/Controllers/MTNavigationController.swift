//
//  MTNavigationController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTNavigationController: UINavigationController {
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    configureNavigationBar()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  private func configureNavigationBar() {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .systemBackground
    appearance.shadowColor = .systemBackground
    self.navigationBar.compactAppearance = appearance
    self.navigationBar.standardAppearance = appearance
    self.navigationBar.scrollEdgeAppearance = appearance
    self.navigationBar.compactScrollEdgeAppearance = appearance
    self.navigationBar.prefersLargeTitles = true
    self.navigationBar.tintColor = UIColor(red: (255.0/255.0), green: (87.0/255.0), blue: (87.0/255.0), alpha: 1.0)
  }
  
  
}
