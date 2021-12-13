//
//  MTMealDetailTableViewDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

//class MTMealDetailTableViewDataSource: NSObject {
//
//  private weak var mealDetailController: MTMealDetailController!
//
//  init(mealDetailController: MTMealDetailController) {
//    self.mealDetailController = mealDetailController
//  }
//
//}
//
//extension MTMealDetailTableViewDataSource: UITableViewDataSource {
//
//  func numberOfSections(in tableView: UITableView) -> Int {
//    4
//  }
//
//  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    switch section {
//    case 0:
//      return nil
//    case 1:
//      return nil
//    case 2:
//      return "Ingredients"
//    case 3:
//      return "Preparation"
//    default:
//      return nil
//    }
//  }
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    switch section {
//    case 0:
//      return 1
//    case 1:
//      return 1
//    case 2:
//      return mealDetailController.mealDetail.ingredientsWithMeasurements.count
//    case 3:
//      return mealDetailController.mealDetail.preparations.count
//    default:
//      return 0
//    }
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    <#code#>
//  }
//}
