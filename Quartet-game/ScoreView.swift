//
//  ScoreView.swift
//  Quartet-game
//
//  Created by Bruno Oliveira on 19/11/24.
//

import SwiftUI

struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Text(String(score))
                .font(.system(size: 56))
            
            Text(Rank.name(for: score))
                .font(.title3.bold())
                .minimumScaleFactor(0.5)
        }
    }
}

#Preview {
    ScoreView(score: 16)
}
