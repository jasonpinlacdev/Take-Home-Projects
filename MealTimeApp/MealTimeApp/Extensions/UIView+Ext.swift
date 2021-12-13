//
//  UIView+Ext.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

extension UIView {
  
  func turnOnYellowBorder() {
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.systemYellow.cgColor
  }
  
}
