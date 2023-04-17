//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Марсель on 17.04.2023.
//

import Foundation
import UIKit

class ResultAlertPresenter {
    private weak var delegate: ResultAlertPresenterDelegate?
    
    init(delegate: ResultAlertPresenterDelegate) {
        self.delegate = delegate
    }
    
    func showAlert(alertModel: AlertModel) {
        guard let viewController = delegate?.viewControllerForAlertPresentation() else { return }
        
        let alert = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion()
        }
        
        alert.addAction(action)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
