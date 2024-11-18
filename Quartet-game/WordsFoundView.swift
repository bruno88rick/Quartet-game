//
//  WordsFoundView.swift
//  Quartet-game
//
//  Created by Bruno Oliveira on 18/11/24.
//

import SwiftUI

struct WordsFoundView: View {
    
    var words: [[String]]
    
    var body: some View {
        let wordsString = words.map { $0.joined() }.joined(separator: ", ")
        
        Text(wordsString)
    }
}

#Preview {
    WordsFoundView(words: [["Hel", "lo"], ["Wor", "ld"]])
}
