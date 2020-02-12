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
    
    public var isPressed = false
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(longPressed(_:)))
        return gesture
    }()
    
    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Question title"
        return label
    }()
    
    public lazy var ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.addTarget(self, action: #selector(ellipButtonPressed(_:)), for: .touchUpInside)
        return button
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
        isPressed.toggle()
        animate()
    }
    
    @objc public func ellipButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(cell: self, card: selCard)
    }
    
    @objc private func animate(){
        let duration: Double = 1.8
        let curveOption: UIView.AnimationOptions = .curveEaseInOut
        
        // the four built-in bezier animations curves
        // curveEaseIn
        // curveEaseOut
        // curveLinear
        
        
      
    }
}
