//
//  MTCategoriesDiffableDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 1/4/22.
//

import UIKit

enum MTCategoriesCollectionViewSection {
  case main
}

class MTCategoriesDiffableDataSource: UICollectionViewDiffableDataSource<MTCategoriesCollectionViewSection, MTCategory> {

  func update(with categories: [MTCategory]) {
    var snapshot = NSDiffableDataSourceSnapshot<MTCategoriesCollectionViewSection, MTCategory>()
    snapshot.appendSections([.main])
    snapshot.appendItems(categories, toSection: .main)
    self.apply(snapshot)
  }
  
}
