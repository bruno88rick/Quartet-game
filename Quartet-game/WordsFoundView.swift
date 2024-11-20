//
//  WordsFoundView.swift
//  Quartet-game
//
//  Created by Bruno Oliveira on 18/11/24.
//

import SwiftUI

struct WordsFoundView: View {
    @State private var isExpanded = true
    
    let wordLayout = Array(repeating: GridItem(.flexible(minimum: 50, maximum: 500)), count: 2)
    
    var words: [[String]]
    
    var body: some View {
        VStack {
            HStack {
                if isExpanded {
                    Text("^[\(words.count) words](inflect: true)")
                        .padding(.horizontal, 30)
                } else {
                    VStack(alignment: .leading) {
                        Text("WORDS FOUND")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.secondary)
                            .font(.caption.bold())
                        
                        Group {
                            if words.isEmpty {
                                Text(" ")
                            } else {
                                let wordsString = words.map {
                                    $0.joined()
                                }.joined(separator: ", ")
                                
                                Text(wordsString)
                                    .lineLimit(1)
                            }
                        }
                        .font(.body)
                    }
                }
                
                Spacer()
                
                Button(action: toggleExpanded) {
                    Label("Expand", systemImage: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .padding(5)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.circle)
            }
            .opacity(words.isEmpty ? 0 : 1)
            .overlay(
                words.isEmpty ? Text("Words you find appear here")
                    .foregroundStyle(.tertiary)
                    .font(.body.bold())
                    .padding(.vertical, 25)
                : nil
            )
            
            if isExpanded {
                LazyVGrid(columns: wordLayout) {
                    ForEach(0..<words.count, id: \.self) { index in
                        let word = words[index]
                        
                        VStack {
                            HStack {
                                Text(word.joined())
                                
                                Spacer()
                                
                                Text(String(word.score))
                                    .padding(.horizontal)
                                    .foregroundStyle(.blue)
                            }
                            
                            if hasRowBelow(index: index) {
                                Divider()
                            } else {
                                Divider()
                                    .hidden()
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .font(.body)
                .padding(.horizontal, 10)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.quaternary)
                .offset(y: 4)
        )
    }

    func toggleExpanded() {
        isExpanded.toggle()
    }
    
    func hasRowBelow(index: Int) -> Bool {
        index + wordLayout.count < words.count
    }
    
}

#Preview {
    WordsFoundView(words: [["pa", "no", "ra", "mic"], ["ca", "lam", "it", "ous"], ["sp", "it"]])
}
