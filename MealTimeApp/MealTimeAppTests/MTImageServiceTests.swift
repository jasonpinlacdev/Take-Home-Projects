//
//  MTImageServiceTests.swift
//  MealTimeAppTests
//
//  Created by Jason Pinlac on 1/27/22.
//

import XCTest
@testable import MealTimeApp

class MTImageServiceTests: XCTestCase {
    
    var sut: MTImageService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MTImageService()
        sut.removeAllEntriesInCache()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testImageServiceStoresImageInCacheCorrectly() {
        // given
        let stubbedEndpoint = "http://testurl.com"
        let stubbedURL = URL(string: stubbedEndpoint)!
        let stubbedData: Data? = UIImage(systemName: "car")!.pngData()
        let stubbedResponse = HTTPURLResponse(url: stubbedURL, statusCode: 200, httpVersion: nil, headerFields: nil)
       
        // our MTImageService has a urlSession property of type URLSessionRepresentable. This is an protocol/abstraction that allows our URLSessionStub to be used in place of the URLSession for stubbing/testing purposes.
        // this is a great example of using dependency injection (property injection) and protcols to decouple concrete types allowing a dependent type to be flexibile through an abstract dependency.
        // This means any type that adopts and conforms to the protocol URLSessionRepresentable can be used as the URLSession dependency.
        let urlSessionStub = URLSessionStub(stubbedData: stubbedData, stubbedResponse: stubbedResponse, stubbedError: nil)
        sut.urlSession = urlSessionStub
        
        let promise = expectation(description: "An image was cached.")
  
        // when
        let stubbedDataTask = sut.getThumbnail(from: stubbedEndpoint) { (result: Result<UIImage, MTNetworkingError>) in
            // then
            switch result {
            case .success(_):
                // if we reach the success case and task is not nil, this means that our image was fetched cached.
                promise.fulfill()
            case .failure(_):
                // fail the test if we reach this failure case. This means the data was not retrieved nor was it cached
                XCTFail("The image was not cached.")
            }
        }
        
        XCTAssertTrue((stubbedDataTask != nil), "Stubbed dataTask is nil. This means that our image was not cached.")
        wait(for: [promise], timeout: 5)
    }
    
    func testImageServiceRetrievesFromCacheCorrectly() {
        // given
        let stubbedEndpoint = "http://testurl.com"
        let stubbedURL = URL(string: stubbedEndpoint)!
        let stubbedData: Data? = UIImage(systemName: "car")!.pngData()
        let stubbedResponse = HTTPURLResponse(url: stubbedURL, statusCode: 200, httpVersion: nil, headerFields: nil)
     
        let urlSessionStub = URLSessionStub(stubbedData: stubbedData, stubbedResponse: stubbedResponse, stubbedError: nil)
        sut.urlSession = urlSessionStub
        
        // when
        // request and store an image in the cache
        _ = sut.getThumbnail(from: stubbedEndpoint) { (result: Result<UIImage, MTNetworkingError>) in
            switch result {
            case .success(_):
                // if we reach the success case and task is not nil, this means that our image was fetched cached.
                break
            case .failure(_):
                // fail the test if we reach this failure case. This means the data was not retrieved nor was it cached
                XCTFail("The image was not retrieved.")
            }
        }
        
        let promise = expectation(description: "An image retrieved successfully from the cache.")
        
        // request an image from the cache
        let stubbedDataTask2 = sut.getThumbnail(from: stubbedEndpoint) { (result: Result<UIImage, MTNetworkingError>) in
            switch result {
            case .success(_):
                // then
                // promise fufill here. This means that the image retrieved was from the cache. The cache is private so there isnt a way to directly check its entries.
                promise.fulfill()
            case .failure(_):
                // fail the test if we reach this failure case. This means the data was not retrieved nor was it cached
                XCTFail("The image was not retrieved.")
            }
        }
        
        // then
        // assert that the dataTask is nil. This means that the image was fetched from the cache and not downloaded.
        XCTAssertNil(stubbedDataTask2, "A dataTask was created to get the image. This means that the image was not retrieved from the cache.")
        wait(for: [promise], timeout: 5)
    }
    
}
