//
//  MTMealDetailViewController+UITableViewDelegate.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/21/21.
//

import UIKit

extension MTMealDetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 { return 200 }
    return UITableView.automaticDimension
  }
  
  
  func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
    return false
  }
  
}
