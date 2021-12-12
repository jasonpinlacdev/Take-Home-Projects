//
//  MTMealDetail.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import Foundation

struct MTMealDetail {
  let id: String
  let name: String
  let category: String
  let thumbnailURL: String
  
  let alternateDrinkName: String?
  let area: String?
  let instructions: String?
  let tags: String?
  let youtubeURL: String
  let ingredient1: String?
  let ingredient2: String?
  let ingredient3: String?
  let ingredient4: String?
  let ingredient5: String?
  let ingredient6: String?
  let ingredient7: String?
  let ingredient8: String?
  let ingredient9: String?
  let ingredient10: String?
  let ingredient11: String?
  let ingredient12: String?
  let ingredient13: String?
  let ingredient14: String?
  let ingredient15: String?
  let ingredient16: String?
  let ingredient17: String?
  let ingredient18: String?
  let ingredient19: String?
  let ingredient20: String?
  let ingredientMeasure1: String?
  let ingredientMeasure2: String?
  let ingredientMeasure3: String?
  let ingredientMeasure4: String?
  let ingredientMeasure5: String?
  let ingredientMeasure6: String?
  let ingredientMeasure7: String?
  let ingredientMeasure8: String?
  let ingredientMeasure9: String?
  let ingredientMeasure10: String?
  let ingredientMeasure11: String?
  let ingredientMeasure12: String?
  let ingredientMeasure13: String?
  let ingredientMeasure14: String?
  let ingredientMeasure15: String?
  let ingredientMeasure16: String?
  let ingredientMeasure17: String?
  let ingredientMeasure18: String?
  let ingredientMeasure19: String?
  let ingredientMeasure20: String?
  let source: String?
  let sourceImageURL: String?
  let creativeCommonsConfirmed: String?
  let dateModified: String?
}


extension MTMealDetail: Codable {
  enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case name = "strMeal"
    case category = "strCategory"
    case thumbnailURL = "strMealThumb"
    
    case alternateDrinkName = "strDrinkAlternate"
    case area = "strArea"
    case instructions = "strInstructions"
    case tags = "strTags"
    case youtubeURL = "strYoutube"
    case ingredient1 = "strIngredient1"
    case ingredient2 = "strIngredient2"
    case ingredient3 = "strIngredient3"
    case ingredient4 = "strIngredient4"
    case ingredient5 = "strIngredient5"
    case ingredient6 = "strIngredient6"
    case ingredient7 = "strIngredient7"
    case ingredient8 = "strIngredient8"
    case ingredient9 = "strIngredient9"
    case ingredient10 = "strIngredient10"
    case ingredient11 = "strIngredient11"
    case ingredient12 = "strIngredient12"
    case ingredient13 = "strIngredient13"
    case ingredient14 = "strIngredient14"
    case ingredient15 = "strIngredient15"
    case ingredient16 = "strIngredient16"
    case ingredient17 = "strIngredient17"
    case ingredient18 = "strIngredient18"
    case ingredient19 = "strIngredient19"
    case ingredient20 = "strIngredient20"
    case ingredientMeasure1 = "strMeasure1"
    case ingredientMeasure2 = "strMeasure2"
    case ingredientMeasure3 = "strMeasure3"
    case ingredientMeasure4 = "strMeasure4"
    case ingredientMeasure5 = "strMeasure5"
    case ingredientMeasure6 = "strMeasure6"
    case ingredientMeasure7 = "strMeasure7"
    case ingredientMeasure8 = "strMeasure8"
    case ingredientMeasure9 = "strMeasure9"
    case ingredientMeasure10 = "strMeasure10"
    case ingredientMeasure11 = "strMeasure11"
    case ingredientMeasure12 = "strMeasure12"
    case ingredientMeasure13 = "strMeasure13"
    case ingredientMeasure14 = "strMeasure14"
    case ingredientMeasure15 = "strMeasure15"
    case ingredientMeasure16 = "strMeasure16"
    case ingredientMeasure17 = "strMeasure17"
    case ingredientMeasure18 = "strMeasure18"
    case ingredientMeasure19 = "strMeasure19"
    case ingredientMeasure20 = "strMeasure20"
    case source = "strSource"
    case sourceImageURL = "strImageSource"
    case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
    case dateModified
  }
}
