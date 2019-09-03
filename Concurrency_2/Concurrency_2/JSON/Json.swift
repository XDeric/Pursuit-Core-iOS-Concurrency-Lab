//
//  JSON.swift
//  Concurrency
//
//  Created by EricM on 9/3/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import Foundation
import UIKit

struct Country: Codable{
    let name: String
    let flag: String
    let capital: String
    let population: Int
    let currencies: [currency]
    
    static func getCountry(from data: Data) -> Country{
        do{
            let state = try JSONDecoder().decode(Country.self, from: data)
            return state
        } catch let anError { fatalError( "\(anError)" )}
    }
}

struct currency: Codable {
    let code: String
}


struct Exchange: Codable{
    let rates: Double
    
    
    static func getMoney(from data: Data) -> Exchange{
        do{
            let value = try JSONDecoder().decode(Exchange.self, from: data)
            return value
        } catch let anError { fatalError( "\(anError)" )}
    }
}
