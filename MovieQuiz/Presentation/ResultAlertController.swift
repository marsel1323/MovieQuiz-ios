//
//  ResultAlertController.swift
//  MovieQuiz
//
//  Created by Марсель on 18.04.2023.
//

import UIKit

final class ResultAlertController: UIAlertController {
    
    var visualEffectView: UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVisualEffectView()
    }
    
    private func setupVisualEffectView() {
        let effect = UIBlurEffect(style: .dark)
        visualEffectView = UIVisualEffectView(effect: effect)
        visualEffectView?.frame = UIScreen.main.bounds
        visualEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if let visualEffectView = visualEffectView {
            view.insertSubview(visualEffectView, at: 0)
        }
    }
}


