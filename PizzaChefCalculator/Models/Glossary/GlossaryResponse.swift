//
//  GlossaryResponse.swift
//  PizzaChefCalculator
//
//  Created by bertrand villain on 05/01/2021.
//  Copyright © 2021 bertrand villain. All rights reserved.
//

import Foundation

struct GlossaryResponse: Decodable {
    let terms: [Term]
}
