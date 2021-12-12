//
//  MTMeal.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import Foundation

struct MTMeal {
  let name: String
  let thumbnailURL: String
  let id: String
}

extension MTMeal: Codable {
  enum CodingKeys: String, CodingKey {
    case name =  "strMeal"
    case thumbnailURL = "strMealThumb"
    case id = "idMeal"
  }
}
