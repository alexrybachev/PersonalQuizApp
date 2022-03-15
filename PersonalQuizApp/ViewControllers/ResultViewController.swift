//
//  ResultViewController.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Rybachev on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var yourTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        choseMaximumValue(from: answers)
    }
    
    // MARK: - Private Methods
    private func choseMaximumValue(from answers: [Answer]) {
        
        var dictionaryAnswer: [Animal: Int] = [:]
                
        for answer in answers {
            if let animalCount = dictionaryAnswer[answer.animal] {
                dictionaryAnswer.updateValue(animalCount + 1, forKey: answer.animal)
            } else {
                dictionaryAnswer[answer.animal] = 1
            }
        }

        let sortedAnswers = dictionaryAnswer.sorted { $0.value > $1.value }
        
        guard let firstAnswer = sortedAnswers.first?.key else { return }
        
        yourTypeLabel.text = "Вы - \(firstAnswer.rawValue)!"
        descriptionLabel.text = "\(firstAnswer.definition)"
    }
}
