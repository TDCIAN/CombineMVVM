//
//  CombineMVVMTests.swift
//  CombineMVVMTests
//
//  Created by 김정민 on 4/22/24.
//

import XCTest
import Combine
@testable import CombineMVVM

final class CombineMVVMTests: XCTestCase {
    
    var sut: QuoteViewModel!
    var quoteService: MockQuoteServiceType!
    
    override func setUp() {
        self.quoteService = MockQuoteServiceType()
        self.sut = QuoteViewModel(quoteServiceType: self.quoteService)
    }

    override func tearDown() {
        
    }
}

class MockQuoteServiceType: QuoteServiceType {
    var value: AnyPublisher<Quote, any Error>?
    func getRandomQuote() -> AnyPublisher<Quote, any Error> {
        return self.value ?? Empty().eraseToAnyPublisher()
    }
}
