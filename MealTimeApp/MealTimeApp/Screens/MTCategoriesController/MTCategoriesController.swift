//
//  MTCategoriesViewController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import UIKit

class MTCategoriesController: UIViewController {
  
  var categories: [MTCategory] = []
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  let collectionViewDelegateFlowLayout = MTCategoriesCollectionViewDelegateFlowLayout(numberOfItemsPerRow: 2, spacingBetweenItems: 10)
  var collectionViewDiffableDataSource: MTCategoriesCollectionViewDiffableDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureCollectionViewLayout()
    configureCollectionViewDiffableDataSource()
    getCategoriesForCollectionView()
  }
  
  private func configure() {
    self.title = "Categories"
    self.view.backgroundColor = .systemBackground
  }
  
  private func configureCollectionViewLayout() {
    self.collectionView.backgroundColor = .systemRed
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(self.collectionView)
    NSLayoutConstraint.activate([
      collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
      collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
      collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
    self.collectionView.delegate = collectionViewDelegateFlowLayout
  }
  
  private func configureCollectionViewDiffableDataSource() {
    self.collectionView.register(MTCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MTCategoryCollectionViewCell.reuseIdentifier)
    self.collectionViewDiffableDataSource = MTCategoriesCollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MTCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? MTCategoryCollectionViewCell else { fatalError("Failed to dequeue a MTCategoryCollectionViewCell") }
      return cell
    })
    collectionViewDiffableDataSource.update(with: self.categories)
  }
  
  
  private func getCategoriesForCollectionView() {
    self.showLoadingView()
    MTNetworkManager.shared.getCategories { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case.success(let categories):
          self?.categories = categories
          self?.collectionViewDiffableDataSource.update(with: categories)
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
