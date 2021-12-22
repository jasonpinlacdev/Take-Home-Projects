//
//  MTMealsController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsViewController: UIViewController {
  
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
    configureTableViewLayout()
    configureTableView()
  }
  
  
  private func configure() {
    self.view.backgroundColor = .systemBackground
  }
  
  
  private func configureTableViewLayout() {
    self.view.addSubview(tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
      self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      self.tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    ])
  }
  
  
  private func configureTableView() {
    tableView.register(MTMealsTableViewCell.self, forCellReuseIdentifier: MTMealsTableViewCell.reuseIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
}
