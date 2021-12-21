//
//  MTMealDetailController.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/13/21.
//

import UIKit

class MTMealDetailViewController: UIViewController {
  
  let mealDetail: MTMealDetail
  let tableView = UITableView()
  lazy var tableViewDataSource = MTMealDetailTableViewDataSource(mealDetailController: self)
  lazy var tableViewDelegate = MTMealDetailTableViewDelegate(mealDetailController: self)
  
  
  init(mealDetail: MTMealDetail) {
    self.mealDetail = mealDetail
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
    self.navigationItem.largeTitleDisplayMode = .never
  }
  
  
  private func configureTableViewLayout() {
    let padding: CGFloat = 5.0
    self.view.addSubview(self.tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
      tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding),
    ])
  }
  
  
  private func configureTableView() {
    tableView.register(MTMealDetailBannerTableViewCell.self, forCellReuseIdentifier: MTMealDetailBannerTableViewCell.reuseIdentifier)
    tableView.register(MTMealDetailTitleTableViewCell.self, forCellReuseIdentifier: MTMealDetailTitleTableViewCell.reuseIdentifier)
    tableView.register(MTMealDetailIngredientTableViewCell.self, forCellReuseIdentifier: MTMealDetailIngredientTableViewCell.reuseIdentifier)
    tableView.register(MTMealDetailPreparationTableViewCell.self, forCellReuseIdentifier: MTMealDetailPreparationTableViewCell.reuseIdentifier)
    tableView.register(MTMealDetailYoutubeTableViewCell.self, forCellReuseIdentifier: MTMealDetailYoutubeTableViewCell.reuseIdentifier)
    tableView.dataSource = self.tableViewDataSource
    tableView.delegate = self.tableViewDelegate
    tableView.separatorStyle = .none
//    tableView.estimatedRowHeight = UITableView.automaticDimension
  }
  
}
