//
//  MTCategoriesViewController+UICollectionViewDelegateFlowLayout.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/21/21.
//

import UIKit


extension MTCategoriesViewController: UICollectionViewDelegateFlowLayout {
  
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
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let diffableDataSource = collectionView.dataSource as? UICollectionViewDiffableDataSource<MTCategoriesCollectionViewSection, MTCategory> else { return }
    guard let category = diffableDataSource.itemIdentifier(for: indexPath) else { return }
    self.showLoadingView()
    MTNetworkManager.shared.getMeals(for: category.name) { [weak self] result in
      DispatchQueue.main.async {
        self?.removeLoadingView()
        switch result {
        case .success(let meals):
          let mealsController = MTMealsViewController(meals: meals)
          mealsController.title = "\(category.name) Dishes"
          self?.navigationController?.pushViewController(mealsController, animated: true)
        case .failure(let error):
          self?.presentAlert(error: error)
        }
      }
    }
  }
  
}
