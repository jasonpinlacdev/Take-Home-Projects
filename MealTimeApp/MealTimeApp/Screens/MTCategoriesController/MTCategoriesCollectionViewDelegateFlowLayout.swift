//
//  MTCategoriesCollectionViewDelegateFlowLayout.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit


class MTCategoriesCollectionViewDelegateFlowLayout: NSObject {
  
  private let numberOfItemsPerRow: CGFloat
  private let spacingBetweenItems: CGFloat
  private var categoriesController: MTCategoriesController
  
  init(numberOfItemsPerRow: CGFloat, spacingBetweenItems: CGFloat, categoriesController: MTCategoriesController) {
    self.numberOfItemsPerRow = numberOfItemsPerRow
    self.spacingBetweenItems = spacingBetweenItems
    self.categoriesController = categoriesController
    super.init()
  }
  
}


extension MTCategoriesCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let diffableDataSource = collectionView.dataSource as? MTCategoriesCollectionViewDiffableDataSource else { return }
    guard let category = diffableDataSource.itemIdentifier(for: indexPath) else { return }
    categoriesController.showLoadingView()
    MTNetworkManager.shared.getMeals(for: category.name) { [weak self] result in
      DispatchQueue.main.async {
        self?.categoriesController.removeLoadingView()
        switch result {
        case .success(let meals):
          let mealsController = MTMealsController(meals: meals)
          mealsController.title = "\(category.name) Dishes"
          self?.categoriesController.navigationController?.pushViewController(mealsController, animated: true)
        case .failure(let error):
          self?.categoriesController.presentAlert(error: error)
        }
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let horizontalSpace = collectionView.bounds.width
    let paddingSpace = (numberOfItemsPerRow + 1) * spacingBetweenItems
    let availableSpace = horizontalSpace - paddingSpace
    let width = availableSpace/numberOfItemsPerRow
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return spacingBetweenItems
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return spacingBetweenItems
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: spacingBetweenItems, left: spacingBetweenItems, bottom: spacingBetweenItems, right: spacingBetweenItems)
  }
  
}
