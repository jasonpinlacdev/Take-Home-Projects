//
//  MTMealsViewController+UITableViewDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/21/21.
//

import UIKit

extension MTMealsViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.meals.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MTMealsTableViewCell.reuseIdentifier, for: indexPath) as? MTMealsTableViewCell else { fatalError() }
    let meal = self.meals[indexPath.row]
    // reset the cell to the placeholder state and cancel the last network request to download the thumbnail image data.
    cell.cancelThumbnailImageRequest()
    cell.resetToPlaceholderState()
    cell.set(meal)
    return cell
  }
  
}
