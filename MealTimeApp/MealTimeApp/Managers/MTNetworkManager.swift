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
    
    // TO DO - ENHANCEMENTS
    
    // 0 - DONE - FIX TABLEVIEW COLLECTIONVIEW DATARACE GLITCH WITH CANCELING THE PREVIOUS DATA TASK. THIS CAN BE INVOKER WITHIN THE CELLFORREUSE METHOD OR IN THE CELL'S PREPAREFORREUSE.
    // We must be careful that a user of our app doesnt waste their data on a nuch of network calls happening in the background
    // I created a separate class to house the functionality for fetching thumbnail images and cacheing. IE. MTImageService
    
    // 1 - DONE - refactor the ViewControllers so that I abstract away code in sperate file extensions rather than make subclasses
    // instead of having different objects act as the datasource and delegate and creating references to their dependent ViewController, I make the datasource and delegate the ViewController and create extensions in their own separate files of the VC to hold code for datasource/delgate respectively.
    
    // 2 - DONE - refactor the ViewControllers so that the network calls occur within them. IE Call site is on the VC.
    // What if there are multiple gateways into each viewcontroller? we would have to make network calls for the data to inject each time. Instead, make the network calls in the VC. This reduces code duplication.
    
    // 3 - DONE - MAKE THE NETWORKMANAGER TAKE ADVANTAGE OF GENERICS
    // How could you make the network manager better?
    
    // 4 - DONE - ADD UNIT TESTING USING STUBS/MOCKS SETUP VIA DEPENDENCY INJECTION AND PROTOCOLS
    // How did you make sure the image cache in the networking class works?
    // unit test for the fetching the image and cacheing logic. Use stubs to simulate the network call so we can quickly test cache storing and retrieval logic.
    
    // 5 - LOOK INTO CREATING THIS SAME PROJECT USING MVVM ARCHITECTURE
    
    
    // generic function implementation
    func getPayload<T:Decodable>(at endpoint: String, completion: @escaping (Result<T, MTNetworkingError>) -> Void) {
        guard let url = URL(string: endpoint) else { completion(.failure(.invalidURL)); return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { completion(.failure(.localError)); return}
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completion(.failure(.serverError)); return }
            guard let data = data else { completion(.failure(.dataError)); return }
            guard let payload = try? JSONDecoder().decode(T.self, from: data) else { completion(.failure(.dataDecodingError)); return }
            completion(.success(payload))
        }
        dataTask.resume()
    }
    
    
//    func getCategories(completionHandler: @escaping (Result<[MTCategory], MTNetworkingError>) -> Void) {
//        let endPoint = baseURL + "categories.php"
//        guard let url = URL(string: endPoint) else { completionHandler(.failure(.invalidURL)); return }
//        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else { completionHandler(.failure(.localError)); return }
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
//            guard let data = data else { completionHandler(.failure(.dataError)); return }
//            guard let categoriesResponse = try? JSONDecoder().decode(MTCategoriesResponse.self, from: data) else { completionHandler(.failure(.dataDecodingError)); return }
//            let categories: [MTCategory] = categoriesResponse.categories.sorted { $0.name.lowercased() < $1.name.lowercased() }
//            completionHandler(.success(categories))
//        }
//        task.resume()
//    }
    
    
//    func getMeals(for categoryName: String, completionHandler: @escaping (Result<[MTMeal], MTNetworkingError>) -> Void) {
//        let endPoint = baseURL + "filter.php?c=\(categoryName)"
//        guard let url = URL(string: endPoint) else { completionHandler(.failure(.invalidURL)); return }
//        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else { completionHandler(.failure(.localError)); return }
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
//            guard let data = data else { completionHandler(.failure(.dataError)); return }
//            guard let mealsResponse = try? JSONDecoder().decode(MTMealsResponse.self, from: data) else { completionHandler(.failure(.dataDecodingError)); return }
//            let meals: [MTMeal] = mealsResponse.meals.sorted { $0.name.lowercased() < $1.name.lowercased() }
//            completionHandler(.success(meals))
//        }
//        task.resume()
//    }
    
    
//    func getMealDetail(for mealId: String, completionHandler: @escaping (Result<MTMealDetail, MTNetworkingError>) -> Void) {
//        let endPoint = baseURL + "lookup.php?i=\(mealId)"
//        guard let url = URL(string: endPoint) else { completionHandler(.failure(.invalidURL)); return }
//        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else { completionHandler(.failure(.localError)); return }
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completionHandler(.failure(.serverError)); return }
//            guard let data: Data = data else { completionHandler(.failure(.dataError)); return }
//            guard let mealDetailsResponse = try? JSONDecoder().decode(MTMealDetailsResponse.self, from: data) else { completionHandler(.failure(.dataDecodingError)); return}
//            let mealDetails: [MTMealDetail] = mealDetailsResponse.mealDetails.sorted { $0.name.lowercased() < $1.name.lowercased() }
//            guard !mealDetails.isEmpty else { completionHandler(.failure(.dataError)); return}
//            completionHandler(.success(mealDetails[0]))
//        }
//        task.resume()
//    }
    
}
