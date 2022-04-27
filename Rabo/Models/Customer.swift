//
//  Customer.swift
//  Rabo
//
//  Created by iSparshIT on 28/04/22.
//

import Foundation

struct Customer: Decodable {
    
    let firstName: String
    let surName: String
    let issueCount: Int64
    private let birthDateStr: String
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
        
    enum CodingKeys: String, CodingKey {
        case firstName = "\"First name\""
        case surName = "\"Sur name\""
        case issueCount = "\"Issue count\""
        case birthDateStr = "\"Date of birth\""
    }
    
    func birthDate() -> Date? {
        return dateFormatter.date(from: birthDateStr)
    }
}
