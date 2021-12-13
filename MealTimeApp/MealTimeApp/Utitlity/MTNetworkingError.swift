//
//  MTError.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/11/21.
//

import Foundation

enum MTNetworkingError: Error {
  case invalidURL
  case localError
  case serverError
  case dataError
  case dataDecodingError
  case invalidYoutubeURL
  
  var title: String {
    switch self {
    case .invalidURL:
      return "Invalid URL Error"
    case .localError:
      return "Invalid Connection Error"
    case .serverError:
      return "Invalid Server Response Error"
    case .dataError:
      return "Invalid Data Error"
    case .dataDecodingError:
      return "Invalid Data Decoding Error"
    case .invalidYoutubeURL:
      return "Invalid YouTube URL"
    }
    
  }
  
  var message: String {
    switch self {
    case .invalidURL:
      return "The url endpoint is invalid."
    case .localError:
      return "Something went wrong. Please check your internet connection and relaunch the app."
    case .serverError:
      return "Something is wrong with the server. Please try again"
    case .dataError:
      return "The data received from the server is invalid."
    case .dataDecodingError:
      return "Something went wrong decoding the data."
    case .invalidYoutubeURL:
      return "This recipe doesn't have a YouTube video demonstration."
    }
  }
  
}
