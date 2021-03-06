//
//  CSVDecoder.swift
//  Rabo
//
//  Created by iSparshIT on 27/04/22.
//

public final class CSVDecoder {
    private var headers = [Header]()
    private var rows = [String]()
    
    public func decode<T>(_ type: T.Type, from string: String) throws -> T where T: Decodable {
        var rows = cleanRows(string).split(separator: "\n")
        let firstLine = rows.removeFirst()
        
        let headers = firstLine.split(separator: ",").enumerated().map({ (index, subSequence) -> Header in
            return Header(key: String(subSequence), index: index)
        })
        
        let remainingRows = rows.map { (substring) -> String in
            return String(substring)
        }
        
        let decoder = _CSVDecoder(headers: headers, rows: remainingRows)
        return try T(from: decoder)
    }
    
    private func cleanRows(_ data: String) -> String {
        return data.replacingOccurrences(of: "\r", with: "\n").replacingOccurrences(of: "\n\n", with: "\n").replacingOccurrences(of: "\r\n", with: "\n")
    }
}

// MARK: Error

internal extension CSVDecoder {
    enum Error: Swift.Error {
        case noHeaders
    }
}

// MARK: _CSVDecoder

internal final class _CSVDecoder {
    // Internal
    public var codingPath = [CodingKey]()
    public var userInfo = [CodingUserInfoKey : Any]()
    
    // Private
    private let headers: [Header]
    private let rows: [String]
    
    // MARK: Initialization
    
    internal required init(headers: [Header], rows: [String]) {
        self.headers = headers
        self.rows = rows
    }
}

// MARK: Decoder

extension _CSVDecoder: Decoder {
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        let row = self.rows.first ?? ""
        let container = KeyedContainer<Key>(headers: self.headers, row: row, codingPath: self.codingPath)
        return KeyedDecodingContainer(container)
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        let container = UnkeyedContainer(headers: self.headers, rows: self.rows, codingPath: self.codingPath)
        return container
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        return SingleValueContainer(headers: self.headers, rows: self.rows, codingPath: self.codingPath)
    }
}

