//
//  MTCategoriesViewController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import UIKit

class MTCategoriesController: UIViewController {
  
  var categories: [MTCategory] = []
  
//  let categoriesCollectionView = UICollectionView(frame: <#T##CGRect#>, collectionViewLayout: <#T##UICollectionViewLayout#>)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    getCategories()
  }
  
  private func configure() {
    self.title = "Categories"
    self.view.backgroundColor = .systemBackground
  }
  
  
  private func getCategories() {
    self.showLoadingView()
    MTNetworkManager.shared.getCategories { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case.success(let categories):
          
          // populate the collectionView and reload it here
          
          self?.categories = categories
          self?.removeLoadingView()
        case .failure(let error):
          let alertController = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in fatalError() }))
          self?.present(alertController, animated: true)
        }
      }
    }
  }
  
}
