//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Марсель on 16.04.2023.
//

import Foundation

struct QuizQuestion {
    let image: Data
    var text: String = "Рейтинг этого фильма больше чем 6?"
    let correctAnswer: Bool
}
