//
//  MTNetworkManager.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import UIKit


class MTNetworkManager {
  
  static let shared = MTNetworkManager()
  let baseURL: String = "https://www.themealdb.com/api/json/v1/1/"
  
  
  private init() { }
  
  
  func getCategories(completionHandler: @escaping (Result<[MTCategory], MTNetworkingError>) -> Void) {
    let endPoint = baseURL + "categories.php"
    guard let url = URL(string: endPoint) else { completionHandler(.failure(.invalidURL)); return }
    let task =  URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else { completionHandler(.failure(.localError)); return }
      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
      guard let data = data else { completionHandler(.failure(.dataError)); return }
      guard let categoriesResponse = try? JSONDecoder().decode(MTCategoriesResponse.self, from: data) else { completionHandler(.failure(.dataDecodingError)); return }
      let categories: [MTCategory] = categoriesResponse.categories.sorted { $0.name.lowercased() < $1.name.lowercased() }
      completionHandler(.success(categories))
    }
    task.resume()
  }
  
  
  func getMeals(for categoryName: String, completionHandler: @escaping (Result<[MTMeal], MTNetworkingError>) -> Void) {
    let endPoint = baseURL + "filter.php?c=\(categoryName)"
    guard let url = URL(string: endPoint) else { completionHandler(.failure(.invalidURL)); return }
    let task =  URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else { completionHandler(.failure(.localError)); return }
      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
      guard let data = data else { completionHandler(.failure(.dataError)); return }
      guard let mealsResponse = try? JSONDecoder().decode(MTMealsResponse.self, from: data) else { completionHandler(.failure(.dataDecodingError)); return }
      let meals: [MTMeal] = mealsResponse.meals.sorted { $0.name.lowercased() < $1.name.lowercased() }
      completionHandler(.success(meals))
    }
    task.resume()
  }
  
  
  func getMealDetails(for mealId: String, completionHandler: @escaping (Result<[MTMealDetail], MTNetworkingError>) -> Void) {
    let endPoint = baseURL + "lookup.php?i=\(mealId)"
    guard let url = URL(string: endPoint) else { completionHandler(.failure(.invalidURL)); return }
    let task =  URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else { completionHandler(.failure(.localError)); return }
      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
      guard let data: Data = data else { completionHandler(.failure(.dataError)); return }
      guard let mealDetailsResponse = try? JSONDecoder().decode(MTMealDetailsResponse.self, from: data) else { completionHandler(.failure(.dataDecodingError)); return}
      let mealDetails: [MTMealDetail] = mealDetailsResponse.mealDetails.sorted { $0.name.lowercased() < $1.name.lowercased() }
      completionHandler(.success(mealDetails))
    }
    task.resume()
  }
  
  func getThumbnail(from url: String, completionHandler: 2es ()->Void) {
    guard let url = URL(string: url) else { return }
    let thumbnailData = Data()
    
  }

}
