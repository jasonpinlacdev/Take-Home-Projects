//
//  MTCategoriesViewController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import UIKit

class MTCategoriesViewController: UIViewController {
  
  var categories: [MTCategory] = []
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  lazy var collectionViewDelegateFlowLayout = MTCategoriesCollectionViewDelegateFlowLayout(numberOfItemsPerRow: 2, spacingBetweenItems: 5, categoriesController: self)
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
    self.view.addSubview(self.collectionView)
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
      collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
      collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
      collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
    self.collectionView.delegate = collectionViewDelegateFlowLayout
  }
  
  
  private func configureCollectionViewDiffableDataSource() {
    self.collectionView.register(MTCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MTCategoryCollectionViewCell.reuseIdentifier)
    self.collectionViewDiffableDataSource = MTCategoriesCollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, category in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MTCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? MTCategoryCollectionViewCell else { fatalError("Failed to dequeue a MTCategoryCollectionViewCell") }
    
      // reset the cell to the placeholder state and cancel the last network request to download the thumbnail image data.
      cell.cancelThumbnailImageRequest()
      cell.categoryThumbnailImageView.image = MTSymbol.forkKnifePlaceholder.image
      cell.categoryBodyLabel.text = "Placeholder"

      cell.set(category)
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
          self?.presentAlert(error: error)
        }
      }
    }
  }
  
}
