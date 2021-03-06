//
//  SingleValueContainer.swift
//  Rabo
//
//  Created by iSparshIT on 27/04/22.
//

internal extension _CSVDecoder {
    final class SingleValueContainer {
        let codingPath: [CodingKey]
        
        // Private
        private let headers: [Header]
        private let rows: [String]
        
        // MARK: Initialization
        
        required init(headers: [Header], rows: [String], codingPath: [CodingKey]) {
            self.headers = headers
            self.rows = rows
            self.codingPath = codingPath
        }
    }
}

// MARK: SingleValueDecodingContainer

extension _CSVDecoder.SingleValueContainer: SingleValueDecodingContainer {
    func decodeNil() -> Bool {
        fatalError("Not implemented")
    }
    
    func decode<T>(_ type: T.Type) throws -> T where T: Decodable {
        fatalError("Not implemented")
    }
    
    func decode<T>(_ type: T.Type) throws -> T where T: Decodable, T: LosslessStringConvertible {
        fatalError("Not implemented")
    }
}

