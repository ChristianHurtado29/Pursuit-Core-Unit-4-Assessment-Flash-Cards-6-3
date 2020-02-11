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
        label.text = "second question"
        return label
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    private func commonInit() {
        setUpLabelConstraints()

    }
    
    private func setUpLabelConstraints() {
        addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant:  10),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    public func configureCell(for card: Cards) {
        questionLabel.text = card.quizTitle
    }
    
}
