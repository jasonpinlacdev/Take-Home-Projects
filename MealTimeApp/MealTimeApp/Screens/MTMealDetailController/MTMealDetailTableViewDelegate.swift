//
//  MTMealDetailTableViewDelegate.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailTableViewDelegate: NSObject {
  
  private weak var mealDetailController: MTMealDetailController!
  
  init(mealDetailController: MTMealDetailController) {
    self.mealDetailController = mealDetailController
  }
  
}

extension MTMealDetailTableViewDelegate: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return 200
    }
    return UITableView.automaticDimension
  }
  
}
