//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Марсель on 17.04.2023.
//

import UIKit

protocol ResultAlertPresenterDelegate: AnyObject {
    func viewControllerForAlertPresentation() -> UIViewController
}
