//
//  MTMealsTableViewDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsTableViewDataSource: NSObject {
  
  private weak var mealsController: MTMealsController!
  
  init(mealsController: MTMealsController) {
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
    let meal = mealsController.meals[indexPath.row]
    cell.textLabel?.text = meal.name
    cell.imageView?.image = MTSymbol.forkKnifePlaceholder.image
    MTNetworkManager.shared.getThumbnail(from: meal.thumbnailURL) { result in
      switch result {
      case .success(let thumbnailImage):
        DispatchQueue.main.async {
          cell.imageView?.image = thumbnailImage
        }
      case .failure(_):
        return
      }
    }
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
}
