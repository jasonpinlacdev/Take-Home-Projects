//
//  MTSymbol.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

enum MTSymbol {
  case forkKnifePlaceholder // 􀸩
  case playFill //􀊄
  
  var image: UIImage {
    switch self {
    case .forkKnifePlaceholder:
      return UIImage(systemName: "fork.knife")!
    case .playFill:
      return UIImage(systemName: "play.fill")!
    }
  }
  
}
