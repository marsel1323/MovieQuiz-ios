//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Марсель on 16.04.2023.
//

import Foundation

final class QuestionFactory: QuestionFactoryProtocol {
    weak var delegate: QuestionFactoryDelegate?
    private var shownQuestionsIndices: Set<Int> = []
    
    init(delegate: QuestionFactoryDelegate) {
        self.delegate = delegate
    }

    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            realRating: 9.2,
            correctAnswer: true
        ),
        QuizQuestion(
            image: "The Dark Knight",
            realRating: 9,
            correctAnswer: true
        ),
        QuizQuestion(
            image: "Kill Bill",
            realRating: 8.1,
            correctAnswer: true
        ),
        QuizQuestion(
            image: "The Avengers",
            realRating: 8,
            correctAnswer: true
        ),
        QuizQuestion(
            image: "Deadpool",
            realRating: 8,
            correctAnswer: true
        ),
        QuizQuestion(
            image: "The Green Knight",
            realRating: 6.6,
            correctAnswer: true
        ),
        QuizQuestion(
            image: "Old",
            realRating: 5.8,
            correctAnswer: false
        ),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            realRating: 4.3,
            correctAnswer: false
        ),
        QuizQuestion(
            image: "Tesla",
            realRating: 5.1,
            correctAnswer: false
        ),
        QuizQuestion(
            image: "Vivarium",
            realRating: 5.8,
            correctAnswer: false
        )
    ]
    
    func requestNextQuestion() {
        let availableIndices = (0..<questions.count).filter { !shownQuestionsIndices.contains($0) }
        
        if availableIndices.isEmpty {
            shownQuestionsIndices.removeAll()
            requestNextQuestion()
            return
        }
        
        guard let index = availableIndices.randomElement() else {
            delegate?.didReceiveNextQuestion(question: nil)
            return
        }
        
        shownQuestionsIndices.insert(index)

        let question = questions[safe: index]
        delegate?.didReceiveNextQuestion(question: question)
    }
}
