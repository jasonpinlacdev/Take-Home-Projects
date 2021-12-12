//
//  MTCategoriesCollectionViewDiffableDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit


enum MTCategoriesSection {
  case main
}

class MTCategoriesCollectionViewDiffableDataSource: UICollectionViewDiffableDataSource<MTCategoriesSection, MTCategory> {

  func update(with categories: [MTCategory]) {
    var snapshot = NSDiffableDataSourceSnapshot<MTCategoriesSection, MTCategory>()
    snapshot.appendSections([.main])
    snapshot.appendItems(categories, toSection: .main)
    self.apply(snapshot)
  }
  
  
}
