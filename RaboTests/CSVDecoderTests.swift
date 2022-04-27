//
//  CSVDecoderTests.swift
//  RaboTests
//
//  Created by iSparshIT on 27/04/22.
//

import XCTest
@testable import Rabo

class CSVDecoderTests: XCTestCase {
    
    func testDecoding() {
        let data = """
        name,age,city,postcode,birthplace
        @Hello,1000,Hell,AppleIndia,
        """
        let decoder = CSVDecoder()
        do{
            let customer = try decoder.decode(FakeCustomer.self, from: data)
            XCTAssertEqual(customer.name, "@Hello")
            XCTAssertEqual(customer.age, 1000)
            XCTAssertEqual(customer.city, "Hell")
            XCTAssertEqual(customer.postcode, "AppleIndia")
            XCTAssertNil(customer.birthplace)
        }
        catch{
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
    func testDecodingArray() {
        let data = """
        name,age,city,postcode,birthplace
        @Hello,1000,Hell,AppleIndia,,India
        Samar,32,Haven,AppleIndia,,India
        """
        let decoder = CSVDecoder()
        do {
            let customers = try decoder.decode([FakeCustomer].self, from: data)
            XCTAssertEqual(customers.count, 2)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    func testKeyNotExisting() {
        let data = """
        Null,age,city,postcode,birthplace
        @Hello,1000,Hell,AppleIndia,,India
        """
        
        let decoder = CSVDecoder()
        do {
            _ = try decoder.decode(FakeCustomer.self, from: data)
            XCTFail()
        }
        catch let error as DecodingError {
            switch error {
            case .keyNotFound(let key, _):
                XCTAssertEqual(key.stringValue, "name")
            default:
                XCTFail("Incorrect error \(error)")
            }
        }
        catch {
            XCTFail("Incorrect error \(error)")
        }
    }
 
    
    // MARK: Customer

    fileprivate struct FakeCustomer: Decodable {
        let name: String
        let age: Int
        let city: String
        let postcode: String?
        let birthplace: String?
        
        // MARK: Coding Keys
        
        enum CodingKeys: String, CodingKey {
            case name
            case age
            case city
            case postcode
            case birthplace
        }
        
    }
    
}
    
