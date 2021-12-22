//
//  MTMealsController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTMealsViewController: UIViewController {
  
  var meals: [MTMeal]
  let tableView = UITableView()
  

  init(meals: [MTMeal]) {
    self.meals = meals
    super.init(nibName: nil, bundle: nil)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureTableViewLayout()
    configureTableView()
  }
  
  
  private func configure() {
    self.view.backgroundColor = .systemBackground
  }
  
  
  private func configureTableViewLayout() {
    self.view.addSubview(tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
      self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      self.tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    ])
  }
  
  
  private func configureTableView() {
    tableView.register(MTMealsTableViewCell.self, forCellReuseIdentifier: MTMealsTableViewCell.reuseIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
}


extension MTMealsViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.meals.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MTMealsTableViewCell.reuseIdentifier, for: indexPath) as? MTMealsTableViewCell else { fatalError() }
    
    // reset the cell to the placeholder state and cancel the last network request to download the thumbnail image data.
    cell.cancelThumbnailImageRequest()
    cell.mealsThumbnailImageView.image = MTSymbol.forkKnifePlaceholder.image
    cell.mealsBodyLabel.text = "Placeholder"
    
    let meal = self.meals[indexPath.row]
    cell.set(meal)
    return cell
  }
  
}


extension MTMealsViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let meal = self.meals[indexPath.row]
    self.showLoadingView()
    MTNetworkManager.shared.getMealDetail(for: meal.id) { [weak self] result in
      DispatchQueue.main.async {
        self?.removeLoadingView()
        switch result {
        case .success(let mealDetail):
          let mealDetailController = MTMealDetailViewController(mealDetail: mealDetail)
          self?.navigationController?.pushViewController(mealDetailController, animated: true)
        case .failure(let error):
          self?.presentAlert(error: error)
        }
      }
    }
  }


  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 175
  }

}
