//
//  MTMealsController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsController: UIViewController {
  
  var meals: [MTMeal]
  
  let tableView = UITableView()
  
  init(meals: [MTMeal]) {
    self.meals = meals
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  private func configure() {
    self.view.backgroundColor = .systemBackground
  }
  
  
  
}
