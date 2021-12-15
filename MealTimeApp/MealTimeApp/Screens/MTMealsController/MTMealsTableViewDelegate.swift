//
//  MTMealsTableViewDelegate.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsTableViewDelegate: NSObject {
  
  private weak var mealsController: MTMealsViewController!
  
  init(mealsController: MTMealsViewController) {
    self.mealsController = mealsController
    super.init()
  }
  
}


extension MTMealsTableViewDelegate: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let meal = mealsController.meals[indexPath.row]
    mealsController.showLoadingView()
    MTNetworkManager.shared.getMealDetail(for: meal.id) { [weak self] result in
      DispatchQueue.main.async {
        self?.mealsController.removeLoadingView()
        switch result {
        case .success(let mealDetail):
          let mealDetailController = MTMealDetailViewController(mealDetail: mealDetail)
          self?.mealsController.navigationController?.pushViewController(mealDetailController, animated: true)
        case .failure(let error):
          self?.mealsController.presentAlert(error: error)
        }
      }
    }
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 175
  }
  
}
