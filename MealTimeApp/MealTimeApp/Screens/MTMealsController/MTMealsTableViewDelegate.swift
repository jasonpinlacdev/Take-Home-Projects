//
//  MTMealsTableViewDelegate.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsTableViewDelegate: NSObject {
  
  private weak var mealsController: MTMealsController!
  
  init(mealsController: MTMealsController) {
    self.mealsController = mealsController
    super.init()
  }
  
}


extension MTMealsTableViewDelegate: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let meal = mealsController.meals[indexPath.row]
    
    print(meal)
  }
  
}
