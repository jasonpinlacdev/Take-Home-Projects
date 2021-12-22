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
    self.showLoadingView()
    MTNetworkManager.shared.getMealDetail(for: meal.id) { [weak self] result in
      DispatchQueue.main.async {
        self?.removeLoadingView()
        switch result {
        case .success(let mealDetail):
          let mealDetailController = MTMealDetailViewController(mealDetail: mealDetail)
          self?.navigationController?.pushViewController(mealDetailController, animated: true)
        case .failure(let error):
          self?.presentAlert(error: error)
        }
      }
    }
  }


  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 175
  }

}
