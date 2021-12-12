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
  
  init(numberOfItemsPerRow: CGFloat, spacingBetweenItems: CGFloat) {
    self.numberOfItemsPerRow = numberOfItemsPerRow
    self.spacingBetweenItems = spacingBetweenItems
    super.init()
  }
  
}


extension MTCategoriesCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let diffableDataSource = collectionView.dataSource as? MTCategoriesCollectionViewDiffableDataSource else { return }
    guard let category = diffableDataSource.itemIdentifier(for: indexPath) else { return }
    print(category.name)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let horizontalSpace = collectionView.bounds.width
    let occupiedSpace = (numberOfItemsPerRow + 1) * spacingBetweenItems
    let availableSpace = horizontalSpace - occupiedSpace
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
