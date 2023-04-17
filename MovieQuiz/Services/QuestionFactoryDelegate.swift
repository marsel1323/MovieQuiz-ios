//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Марсель on 16.04.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
