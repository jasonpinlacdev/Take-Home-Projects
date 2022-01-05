//
//  MTMealsViewController+UITableViewDelegate.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/21/21.
//

import UIKit

extension MTMealsViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let meal = self.meals[indexPath.row]
    let mealDetailViewController = MTMealDetailViewController(mealId: meal.id)
    self.navigationController?.pushViewController(mealDetailViewController, animated: true)
  }


  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 175
  }

}
