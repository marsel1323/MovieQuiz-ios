//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Марсель on 17.04.2023.
//

import Foundation

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    
    func store(correct count: Int, total amount: Int)
}

final class StatisticServiceImplementation: StatisticService {
    private let userDefaults = UserDefaults.standard
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }

    var totalAccuracy: Double {
        let correct = userDefaults.integer(forKey: Keys.correct.rawValue)
        let total = userDefaults.integer(forKey: Keys.total.rawValue)
        return total > 0 ? Double(correct) / Double(total) : 0
    }
    
    var gamesCount: Int {
        get {
            return userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameRecord {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            
            return record
        }
        
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Unable to save game result")
                return
            }
            
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        let newRecord = GameRecord(correct: count, total: amount, date: Date())
        let correct = Keys.correct.rawValue
        let total = Keys.correct.rawValue
        
        if newRecord > bestGame {
            bestGame = newRecord
        }
        
        let currentCorrect = userDefaults.integer(forKey: correct)
        let currentTotal = userDefaults.integer(forKey: total)
        
        userDefaults.set(currentCorrect + count, forKey: correct)
        userDefaults.set(currentTotal + amount, forKey: total)
        gamesCount += 1
    }
    
    
}
