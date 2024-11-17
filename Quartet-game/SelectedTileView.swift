//
//  SelectedTileView.swift
//  Quartet-game
//
//  Created by Bruno Oliveira on 17/11/24.
//

import SwiftUI

struct SelectedTileView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(minHeight: 44, maxHeight: 64)
            .padding(.horizontal)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue.mix(with: .black, by: 0.25))
                    .offset(y: 4)
        )
    }
}

#Preview {
    SelectedTileView(text: "ABC")
}
