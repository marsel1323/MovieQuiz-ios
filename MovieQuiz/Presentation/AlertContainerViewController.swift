//
//  AlertContainerViewController.swift
//  MovieQuiz
//
//  Created by Марсель on 18.04.2023.
//

import UIKit

final class AlertContainerViewController: UIViewController {
    private let alertController: UIAlertController
    
    init(alertController: UIAlertController) {
        self.alertController = alertController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.ypBackground//.withAlphaComponent(0.5)
        addChild(alertController)
        alertController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        alertController.view.frame = view.bounds
        view.addSubview(alertController.view)
        alertController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            alertController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertController.view.widthAnchor.constraint(equalToConstant: 270)
        ])
    }
}
