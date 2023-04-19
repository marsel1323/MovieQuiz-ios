//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Марсель on 16.04.2023.
//

import Foundation

struct QuizQuestion {
    let image: String
    var text: String = "Рейтинг этого фильма больше чем 6?"
    let realRating: Float
    let correctAnswer: Bool
}
