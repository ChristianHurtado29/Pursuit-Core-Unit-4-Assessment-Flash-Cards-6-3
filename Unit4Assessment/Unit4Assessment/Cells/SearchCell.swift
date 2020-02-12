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
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(animate))
        return gesture
    }()
    
    private lazy var factsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "second question"
        return label
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    @objc private func animate(){
    let duration: Double = 1.2
    let curveOption: UIView.AnimationOptions = .curveEaseInOut
        
    // the four built-in bezier animations curves
    // curveEaseIn
    // curveEaseOut
    // curveLinear
    }
    
    @objc private func buttonPressed(){
        let showAlert = UIAlertController(title: "Add?", message: "Add card to your flashcards?", preferredStyle: .alert)
        showAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: nil))
        
        print("hola")
    }
    private func commonInit() {
        setupLabelConstraints()
        setupButton()
    }
    
    private func setupLabelConstraints() {
        addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant:  140),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
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
        questionLabel.text = card.quizTitle
        questionLabel.isUserInteractionEnabled = true
        
        
    }
    
}
