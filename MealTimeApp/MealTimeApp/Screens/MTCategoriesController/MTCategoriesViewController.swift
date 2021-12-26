//
//  MTCategoriesViewController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import UIKit

class MTCategoriesViewController: UIViewController {
  
  enum MTCategoriesCollectionViewSection {
    case main
  }
  
  var categories: [MTCategory] = []
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  var collectionViewDiffableDataSource: UICollectionViewDiffableDataSource<MTCategoriesCollectionViewSection, MTCategory>!
  
  let numberOfItemsPerRow: CGFloat = 2
  let spacingBetweenItems: CGFloat = 5.0
  
  
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
    self.collectionView.delegate = self
  }
  
  
  private func configureCollectionViewDiffableDataSource() {
    self.collectionView.register(MTCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MTCategoryCollectionViewCell.reuseIdentifier)
    self.collectionViewDiffableDataSource = UICollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, category in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MTCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? MTCategoryCollectionViewCell else { fatalError("Failed to dequeue a MTCategoryCollectionViewCell") }
    
      // reset the cell to the placeholder state and cancel the last network request to download the thumbnail image data.
      cell.cancelThumbnailImageRequest()
      cell.resetToPlaceholderState()
      cell.set(category)
      return cell
    })
    
    updateDiffableDataSource(with: self.categories)
  }
  
  
  private func getCategoriesForCollectionView() {
    self.showLoadingView()
    MTNetworkManager.shared.getCategories { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case.success(let categories):
          self?.categories = categories
          self?.updateDiffableDataSource(with: categories)
          self?.removeLoadingView()
        case .failure(let error):
          self?.presentAlert(error: error)
        }
      }
    }
  }
  
  
  func updateDiffableDataSource(with categories: [MTCategory]) {
    var snapshot = NSDiffableDataSourceSnapshot<MTCategoriesCollectionViewSection, MTCategory>()
    snapshot.appendSections([.main])
    snapshot.appendItems(categories, toSection: .main)
    collectionViewDiffableDataSource.apply(snapshot)
  }
  
}



