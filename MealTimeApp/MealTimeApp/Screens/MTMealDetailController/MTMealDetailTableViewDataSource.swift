//
//  MTMealDetailTableViewDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

enum MTMealDetailTableViewSection: String, CaseIterable {
  case banner = "Banner"
  case title = "Title"
  case videoDemonstration = "Video Demonstration"
  case ingredients = "Ingredients"
  case preparations = "Preparations"
}


class MTMealDetailTableViewDataSource: NSObject {

  private weak var mealDetailController: MTMealDetailController!

  init(mealDetailController: MTMealDetailController) {
    self.mealDetailController = mealDetailController
  }

}

extension MTMealDetailTableViewDataSource: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    MTMealDetailTableViewSection.allCases.count
  }

  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 2:
      return MTMealDetailTableViewSection.videoDemonstration.rawValue
    case 3:
      return MTMealDetailTableViewSection.ingredients.rawValue
    case 4:
      return MTMealDetailTableViewSection.preparations.rawValue
    default:
      return nil
    }
  }

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 1
    case 2:
      return 1
    case 3:
      return mealDetailController.mealDetail.ingredientsWithMeasurements.count
    case 4:
      return mealDetailController.mealDetail.preparations.count
    default:
      return 0
    }
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let mealDetail = mealDetailController.mealDetail
    switch indexPath.section {
    case 0:
      guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: MTMealDetailBannerTableViewCell.reuseIdentifier, for: indexPath) as? MTMealDetailBannerTableViewCell else { fatalError("Failed to dequeue a MTMealDetailBannerTableViewCell.") }
      bannerCell.set(thumbnailUrlString: mealDetail.thumbnailURL)
      return bannerCell
    case 1:
      guard let titleCell = tableView.dequeueReusableCell(withIdentifier: MTMealDetailTitleTableViewCell.reuseIdentifier, for: indexPath) as? MTMealDetailTitleTableViewCell else { fatalError("Failed to dequeue a MTMealDetailTitleTableViewCell.") }
      titleCell.set(title: mealDetail.name)
      return titleCell
    case 2:
      guard let youtubeCell = tableView.dequeueReusableCell(withIdentifier: MTMealDetailYoutubeTableViewCell.reuseIdentifier, for: indexPath) as? MTMealDetailYoutubeTableViewCell else { fatalError("Failed to dequeue a MTMealDetailTitleTableViewCell.") }
      if youtubeCell.mealDetailController == nil { youtubeCell.mealDetailController = self.mealDetailController }
      youtubeCell.youtubeURLString = mealDetail.youtubeURL
      return youtubeCell
    case 3:
      guard let ingredientCell = tableView.dequeueReusableCell(withIdentifier: MTMealDetailIngredientTableViewCell.reuseIdentifier, for: indexPath) as? MTMealDetailIngredientTableViewCell else { fatalError("Failed to dequeue a MTMealDetailIngredientTableViewCell.") }
      ingredientCell.set(ingredientAndMeasurement: mealDetail.ingredientsWithMeasurements[indexPath.row])
      return ingredientCell
    case 4:
      guard let preparationCell = tableView.dequeueReusableCell(withIdentifier: MTMealDetailPreparationTableViewCell.reuseIdentifier, for: indexPath) as? MTMealDetailPreparationTableViewCell else { fatalError("Failed to dequeue a MTMealDetailPreparationTableViewCell.") }
      preparationCell.set(preparation: mealDetail.preparations[indexPath.row])
      return preparationCell
    default:
      fatalError("Error. No cell should be dequeued.")
    }
  }
  
}
