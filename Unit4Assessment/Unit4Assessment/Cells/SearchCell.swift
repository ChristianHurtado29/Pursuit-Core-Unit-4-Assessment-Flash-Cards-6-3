//
//  SearchCell.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "first question"
        return label
    }()
    
    private lazy var factsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "facts"
        return label
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var longPressedGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(didLongPress(_:)))
        return gesture
      }()

    @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
          return
        }
        isAnswer.toggle()
        animate()
      }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    private var isAnswer = false
    
    @objc private func animate(){
    let duration: Double = 1.2
        if isAnswer{
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
              self.questionLabel.alpha = 0.0
              self.factsLabel.alpha = 1.0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
              self.questionLabel.alpha = 1.0
              self.factsLabel.alpha = 0.0
            }, completion: nil)
        }
    }
    
    
    
    @objc private func buttonPressed(){
        let showAlert = UIAlertController(title: "Add?", message: "Add card to your flashcards?", preferredStyle: .alert)
        showAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: nil))
        
        print("hola")
    }
    private func commonInit() {
        setupLabelConstraints()
        setupFactsConstraints()
        setupButton()
        addGestureRecognizer(longPressedGesture)
    }
    
    private func setupLabelConstraints() {
        addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant:  10),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    private func setupFactsConstraints() {
        addSubview(factsLabel)
        factsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            factsLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 5),
            factsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            factsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    private func setupButton(){
        addSubview(button)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    public func configureCell(for card: Cards) {
        questionLabel.isUserInteractionEnabled = true
        questionLabel.text = card.quizTitle
        factsLabel.text =
        """
        1 - \(card.facts[0]),
        
        2 - \(card.facts[1])
        """
        factsLabel.alpha = 0.0
        
        
        
    }
    
}
