//
//  MTCategoriesCollectionViewDiffableDataSource.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit


enum MTCategoriesCollectionViewSection {
  case main
}

class MTCategoriesCollectionViewDiffableDataSource: UICollectionViewDiffableDataSource<MTCategoriesCollectionViewSection, MTCategory> {

  func update(with categories: [MTCategory]) {
    var snapshot = NSDiffableDataSourceSnapshot<MTCategoriesCollectionViewSection, MTCategory>()
    snapshot.appendSections([.main])
    snapshot.appendItems(categories, toSection: .main)
    self.apply(snapshot)
  }
  
}
