//
//  CardsCVC.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol CellDetDelegate: AnyObject {
    func didPressButton(cell: CardsCell, card: Cards)
}

class CardsCell: UICollectionViewCell {
    
    weak var delegate: CellDetDelegate?
    public var selCard: Cards!
    public var isAnswer = false
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(longPressed(_:)))
        return gesture
    }()
    
    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Question title" // remove after
        return label
    }()
    
    public lazy var answersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "Answers" // remove after
        return label
    }()
    
    public lazy var optionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(optionsButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var longPressedGesture: UILongPressGestureRecognizer = {
      let gesture = UILongPressGestureRecognizer()
      gesture.addTarget(self, action: #selector(didLongPress(_:)))
      return gesture
    }()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(animate))
        return gesture
    }()
    
    @objc private func longPressed(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            return
        }
        isAnswer.toggle()
        animate()
    }
    
    @objc public func optionsButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(cell: self, card: selCard)
    }
    
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
    
    private func commonInit() {
        setupLabelConstraints()
        setupAnswersConstraints()
        setupButton()
        addGestureRecognizer(longPressedGesture)
    }
    
    @objc private func animate(){
        let duration: Double = 1.2
        if isAnswer{
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
              self.questionLabel.alpha = 0.0
              self.answersLabel.alpha = 1.0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
              self.questionLabel.alpha = 1.0
              self.answersLabel.alpha = 0.0
            }, completion: nil)
        }
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
    
    private func setupAnswersConstraints() {
        addSubview(answersLabel)
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answersLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 5),
            answersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            answersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    private func setupButton(){
        addSubview(optionsButton)
        optionsButton.backgroundColor = .white
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            optionsButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            optionsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            optionsButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    public func configureCell(for card: Cards) {
        questionLabel.text = card.quizTitle
        answersLabel.text = """
        1. \(card.facts[0])
        2. \(card.facts[1])
        """
    }
}
