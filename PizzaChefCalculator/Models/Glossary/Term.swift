//
//  Term.swift
//  PizzaChefCalculator
//
//  Created by bertrand villain on 05/01/2021.
//  Copyright © 2021 bertrand villain. All rights reserved.
//

import Foundation

/**
 * A term defines a word from the glossary and its definition, a key can also be supplied to identify each ones.
 * Both name and defintion are given translated.
 */
struct Term: Decodable {
    let key: String?
    let name: String
    let definition: String
}
