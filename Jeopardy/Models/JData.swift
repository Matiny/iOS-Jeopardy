//
//  JData.swift
//  Jeopardy
//
//  Created by Matiny L on 6/1/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import Foundation


struct OneQuestion: Codable {
    let answer: String
    let question: String
    let value: Int?
    let airdate: String
    let category: Category
}

struct Category: Codable {
    let title: String
}
