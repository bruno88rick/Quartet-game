//
//  Rank.swift
//  Quartet-game
//
//  Created by Bruno Oliveira on 19/11/24.
//

import Foundation

struct Rank {
    var name: String
    var minimumScore: Int
    
    private init(name: String, minimumScore: Int) {
        self.name = name
        self.minimumScore = minimumScore
    }
    
    
    static let allRanks = [
        Rank(name: "Novice", minimumScore: 0),
        Rank(name: "Apprentice", minimumScore: 5),
        Rank(name: "Proficient", minimumScore: 30),
        Rank(name: "Skilled", minimumScore: 65),
        Rank(name: "Expert", minimumScore: 100),
        Rank(name: "Master", minimumScore: 155),
        Rank(name: "Grandmaster", minimumScore: 210),
        Rank(name: "Legendary", minimumScore: 265),
        Rank(name: "Immortal", minimumScore: 320),
        Rank(name: "Eternal", minimumScore: 375),
        Rank(name: "Ancient", minimumScore: 430),
        Rank(name: "Fluent", minimumScore: 485),
    ]
    
    
    static func name(for score: Int) -> String {
        let currentRank = allRanks.last {
            $0.minimumScore <= score
        }
        return currentRank?.name ?? "Unknown"
    }
    
    
    static func progressTowardsNextRank(for score: Int) -> Double {
        
        var previousRankScore = 0
        
        for rank in allRanks {
            if score < rank.minimumScore {
                let gapFromPeviousRank = Double(score - previousRankScore)
                let gapToNextRank = Double(rank.minimumScore - previousRankScore)
                return gapFromPeviousRank / gapToNextRank
            } else {
                previousRankScore = rank.minimumScore
            }
        }
        return 1
    }
}
