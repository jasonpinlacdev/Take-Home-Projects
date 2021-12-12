//
//  MTCategory.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import Foundation

struct MTCategory {
  let id: String
  let name: String
  let thumbnailURL: String
  let description: String
}

extension MTCategory: Codable {
  enum CodingKeys: String, CodingKey {
    case id = "idCategory"
    case name = "strCategory"
    case thumbnailURL = "strCategoryThumb"
    case description = "strCategoryDescription"
  }
}

extension MTCategory: Hashable {
  
}

