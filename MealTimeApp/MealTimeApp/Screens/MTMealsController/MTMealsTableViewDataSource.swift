//
//  MTMealsTableViewDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsTableViewDataSource: NSObject {
  
  private weak var mealsController: MTMealsViewController!
  
  init(mealsController: MTMealsViewController) {
    self.mealsController = mealsController
    super.init()
  }
  
}


extension MTMealsTableViewDataSource: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mealsController.meals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MTMealsTableViewCell.reuseIdentifier, for: indexPath) as? MTMealsTableViewCell else { fatalError() }
    let meal = mealsController.meals[indexPath.row]
    cell.set(meal)
    return cell
  }
  
}
