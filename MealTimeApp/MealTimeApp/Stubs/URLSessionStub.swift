//
//  MTURLSessionStub.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 1/27/22.
//

import Foundation

// This is the abstraction we are using for our dependent object IE the MTImageService. MTImageService has a dependency URLSession of type URLSessionRepresentable. This is set up so we can mock our URLSession dataTask/request.
protocol URLSessionRepresentable {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ) -> URLSessionDataTask
}


// here we are having our URLSession adopt URLSessionRepresentable protocol so that we can either use this class or our stubbed class as a dependency.
extension URLSession: URLSessionRepresentable {}


// this class is the stubbed class of the URLSession that also adopts and conforms to URLSessionRepresentableProtocol. We are using this class for testing purposes.
class URLSessionStub: URLSessionRepresentable {
    
    private let stubbedData: Data?
    private let stubbedResponse: URLResponse?
    private let stubbedError: Error?
    
    init(stubbedData: Data? = nil, stubbedResponse: URLResponse? = nil, stubbedError: Error? = nil) {
        self.stubbedData = stubbedData
        self.stubbedResponse = stubbedResponse
        self.stubbedError = stubbedError
    }
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskStub(stubbedData: self.stubbedData, stubbedResponse: self.stubbedResponse, stubbedError: self.stubbedError, completionHandler: completionHandler)
    }
    
}

// This subclass of URLSessionDataTask is setup so we can stub the dataTask by overriding the resume() method.
class URLSessionDataTaskStub: URLSessionDataTask {
    
    private let stubbedData: Data?
    private let stubbedResponse: URLResponse?
    private let stubbedError: Error?
    private let completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    
    init(stubbedData: Data? = nil, stubbedResponse: URLResponse? = nil, stubbedError: Error? = nil, completionHandler: ((Data?, URLResponse?, Error?) -> Void)? = nil) {
        self.stubbedData = stubbedData
        self.stubbedResponse = stubbedResponse
        self.stubbedError = stubbedError
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        print("STUBBED RESUME")
        completionHandler?(self.stubbedData, self.stubbedResponse, self.stubbedError)
    }
}
