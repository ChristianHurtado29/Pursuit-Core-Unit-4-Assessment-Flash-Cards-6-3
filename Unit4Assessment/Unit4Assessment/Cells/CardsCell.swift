//
//  CardsCVC.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardsCell: UICollectionViewCell {
    
    public lazy var cardsImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "mic")
        iv.backgroundColor = .blue
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Question title"
        return label
    }()
    
    
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(animate))
        return gesture
    }()
    
    
    private func setupCardConstraint() {
        addSubview(cardsImageView)
        cardsImageView.translatesAutoresizingMaskIntoConstraints = false
        cardsImageView.backgroundColor = .red
        NSLayoutConstraint.activate([
            cardsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.50),
            cardsImageView.widthAnchor.constraint(equalTo: cardsImageView.heightAnchor)
        ])
    }
    
    
    @objc private func animate(){
        let duration: Double = 1.8
        let curveOption: UIView.AnimationOptions = .curveEaseInOut
        
        // the four built-in bezier animations curves
        // curveEaseIn
        // curveEaseOut
        // curveLinear
        
        
        if cardsImageView.image == UIImage(named: "dog"){
            UIView.transition(with: cardsImageView, duration: duration, options: [.transitionFlipFromRight, curveOption], animations:  {
                self.cardsImageView.image = UIImage(named: "cat")
            } , completion: nil)
            cardsImageView.image = UIImage(named: "cat")
        } else {
            UIView.transition(with: cardsImageView, duration: 1.0, options: [.transitionFlipFromLeft], animations:  {
                self.cardsImageView.image = UIImage(named: "dog")
            } , completion: nil)
        }
    }
}
