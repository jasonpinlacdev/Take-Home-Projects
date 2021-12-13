//
//  UIViewController+Ext.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

private var loadingViewGlobal: UIView?

extension UIViewController {
  
  func showLoadingView() {
    let loadingView: UIView = {
      let loadingView = UIView(frame: self.view.bounds)
      loadingView.backgroundColor = .black.withAlphaComponent(0.75)
      loadingViewGlobal = loadingView
      return loadingView
    }()
    let activityIndicatorView: UIActivityIndicatorView = {
      let activityIndicatorView = UIActivityIndicatorView(style: .large)
      activityIndicatorView.startAnimating()
      activityIndicatorView.center = loadingView.center
      return activityIndicatorView
    }()
    loadingView.addSubview(activityIndicatorView)
    self.view.addSubview(loadingView)
  }

  
  func removeLoadingView() {
    loadingViewGlobal?.removeFromSuperview()
    loadingViewGlobal = nil
  }
  
  
  func presentAlert(error: MTNetworkingError) {
    let alertController = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
    self.present(alertController, animated: true)
  }
  
}
  

