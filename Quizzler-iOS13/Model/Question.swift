//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Admin on 2/21/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let answer: String
    
    init(q: String, c: [String], a: String) {
        text = q
        choices = c
        answer = a
    }
}
