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
  let youtubeURL: String?
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
  
  var ingrediantsWithMeasurements: [(String, String)] {
    var ingredientsWithMeasurements: [(String, String)] = []
    if let ingredient1 = ingredient1, let ingredientMeasure1 = ingredientMeasure1, !ingredient1.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure1.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient1, ingredientMeasure1 )) }
    if let ingredient2 = ingredient2, let ingredientMeasure2 = ingredientMeasure2, !ingredient2.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure2.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient2, ingredientMeasure2 )) }
    if let ingredient3 = ingredient3, let ingredientMeasure3 = ingredientMeasure3, !ingredient3.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure3.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient3, ingredientMeasure3 )) }
    if let ingredient4 = ingredient4, let ingredientMeasure4 = ingredientMeasure4, !ingredient4.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure4.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient4, ingredientMeasure4 )) }
    if let ingredient5 = ingredient5, let ingredientMeasure5 = ingredientMeasure5, !ingredient5.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure5.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient5, ingredientMeasure5 )) }
    if let ingredient6 = ingredient6, let ingredientMeasure6 = ingredientMeasure6, !ingredient6.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure6.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient6, ingredientMeasure6 )) }
    if let ingredient7 = ingredient7, let ingredientMeasure7 = ingredientMeasure7, !ingredient7.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure7.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient7, ingredientMeasure7 )) }
    if let ingredient8 = ingredient8, let ingredientMeasure8 = ingredientMeasure8, !ingredient8.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure8.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient8, ingredientMeasure8 )) }
    if let ingredient9 = ingredient9, let ingredientMeasure9 = ingredientMeasure9, !ingredient9.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure9.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient9, ingredientMeasure9 )) }
    if let ingredient10 = ingredient10, let ingredientMeasure10 = ingredientMeasure10, !ingredient10.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure10.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient10, ingredientMeasure10)) }
    if let ingredient11 = ingredient11, let ingredientMeasure11 = ingredientMeasure11, !ingredient11.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure11.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient11, ingredientMeasure11)) }
    if let ingredient12 = ingredient12, let ingredientMeasure12 = ingredientMeasure12, !ingredient12.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure12.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient12, ingredientMeasure12)) }
    if let ingredient13 = ingredient13, let ingredientMeasure13 = ingredientMeasure13, !ingredient13.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure13.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient13, ingredientMeasure13)) }
    if let ingredient14 = ingredient14, let ingredientMeasure14 = ingredientMeasure14, !ingredient14.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure14.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient14, ingredientMeasure14)) }
    if let ingredient15 = ingredient15, let ingredientMeasure15 = ingredientMeasure15, !ingredient15.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure15.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient15, ingredientMeasure15)) }
    if let ingredient16 = ingredient16, let ingredientMeasure16 = ingredientMeasure16, !ingredient16.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure16.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient16, ingredientMeasure16)) }
    if let ingredient17 = ingredient17, let ingredientMeasure17 = ingredientMeasure17, !ingredient17.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure17.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient17, ingredientMeasure17)) }
    if let ingredient18 = ingredient18, let ingredientMeasure18 = ingredientMeasure18, !ingredient18.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure18.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient18, ingredientMeasure18)) }
    if let ingredient19 = ingredient19, let ingredientMeasure19 = ingredientMeasure19, !ingredient19.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure19.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient19, ingredientMeasure19)) }
    if let ingredient20 = ingredient20, let ingredientMeasure20 = ingredientMeasure20, !ingredient20.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !ingredientMeasure20.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { ingredientsWithMeasurements.append((ingredient20, ingredientMeasure20)) }
    return ingredientsWithMeasurements
  }
  

//  var instructions: [String] {
//
//  }
  
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
