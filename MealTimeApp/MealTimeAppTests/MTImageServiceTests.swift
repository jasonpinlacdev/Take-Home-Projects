//
//  MTImageServiceTests.swift
//  MealTimeAppTests
//
//  Created by Jason Pinlac on 1/27/22.
//

import XCTest
@testable import MealTimeApp

class MTImageServiceTests: XCTestCase {
    
    let sut: MTImageService = MTImageService()
    
//    func testImageServiceExecutesCacheCorrectly() {
//        // given
//        let endpoint = "https://avatars.githubusercontent.com/u/49731117?v=4"
//        let url = URL(string: endpoint)!
//        let stubbedData =  try? Data(contentsOf: url) // I couldnt figure out how to stub a UIImage() and convert it to Data to decode correctly. So, Im fetching an image syncronously from the web to use as my stub. This test fails without internet.
//        let stubbedResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
//
//        let urlSessionStub = URLSessionStub(stubbedData: stubbedData, stubbedResponse: stubbedResponse, stubbedError: nil)
//        sut.urlSession = urlSessionStub
//        
//        let promise = expectation(description: "An image was successfully cached.")
//
//        // when
//        let stubbedDataTask = sut.getThumbnail(from: endpoint) { (result: Result<UIImage, MTNetworkingError>) in
//            // then
//            switch result {
//            case .success(_):
//                // if we reach the success case and task is not nil, this means that our image was fetched cached.
//                promise.fulfill()
//            case .failure(_):
//                // fail the test if we reach this failure case. This means the data was not retrieved nor was it cached
//                XCTFail("The image was not cached.")
//            }
//        }
//
//        XCTAssertTrue((stubbedDataTask != nil), "Stubbed dataTask is nil. This means that our image was not fetched and cached.")
//        wait(for: [promise], timeout: 5)
//    }
    
    func testImageServiceStoresAndRetrievesFromCacheCorrectly() {
        // given
        let endpoint = "https://avatars.githubusercontent.com/u/49731117?v=4"
        let url = URL(string: endpoint)!
        let stubbedData =  try? Data(contentsOf: url) // I couldnt figure out how to stub a UIImage() and convert it to Data to decode correctly. So, Im fetching an image syncronously from the web to use as my stub. This test fails without internet.
        let stubbedResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let urlSessionStub = URLSessionStub(stubbedData: stubbedData, stubbedResponse: stubbedResponse, stubbedError: nil)
        sut.urlSession = urlSessionStub
        
        let promise1 = expectation(description: "An image was successfully cached.")
        let promise2 = expectation(description: "An image retrieved successfully from the cache.")
        
        // when
        // 1st call to fetch the image and store it in the cache
        let stubbedDataTask1 = sut.getThumbnail(from: endpoint) { (result: Result<UIImage, MTNetworkingError>) in
            // then
            switch result {
            case .success(_):
                // if we reach the success case and task is not nil, this means that our image was fetched cached.
                promise1.fulfill()
            case .failure(_):
                // fail the test if we reach this failure case. This means the data was not retrieved nor was it cached
                XCTFail("The image was not cached.")
            }
        }
        
        XCTAssertTrue((stubbedDataTask1 != nil), "Stubbed dataTask is nil. This means that our image was not fetched and cached.")
        wait(for: [promise1], timeout: 5)
        
        // when
        // 2nd call to fetch the image and see if it gets it from the cache
        let stubbedDataTask2 = sut.getThumbnail(from: endpoint) { (result: Result<UIImage, MTNetworkingError>) in
            switch result {
            case .success(_):
                // then
                // promise fufill here. This means that the image retrieved was from the cache. The cache is private so there isnt a way to directly check its entries.
                promise2.fulfill()
            case .failure(_):
                // fail the test if we reach this failure case. This means the data was not retrieved nor was it cached
                XCTFail("The image was not retrieved.")
            }
        }
        
        // assert that the dataTask is nil. This means that the image was fetched from the cache and not downloaded.
        XCTAssertNil(stubbedDataTask2, "A dataTask was created to get the image. This means that the image was not retrieved from the cache.")
        wait(for: [promise2], timeout: 5)
    }
    
}
