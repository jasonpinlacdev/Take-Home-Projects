//
//  MTMealDetailCollection.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import Foundation

// A MTMealDetailsResponse is an array of mealDetail recipes. IE a meal can be created in a numerous and varying ways, EX by using a different variation of the mealDetail recipe for the meal.
// There can exist multiple MTMealDetail objects for a meal that each represent a different way of making meal, its ingredients, and instructions.
struct MTMealsDetailResponse {
  let mealsDetail: [MTMealDetail]
}

extension MTMealsDetailResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case mealsDetail = "meals"
  }
}
