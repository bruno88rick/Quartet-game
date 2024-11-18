//
//  Array-Score.swift
//  Quartet-game
//
//  Created by Bruno Oliveira on 18/11/24.
//

import Foundation

extension Array {
    var score: Int {
        Int(pow(2, Double(count - 1)))
    }
}
