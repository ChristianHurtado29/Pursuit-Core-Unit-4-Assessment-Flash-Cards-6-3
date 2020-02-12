//
//  CardsView.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CardsView: UIView {
    
    public lazy var cardsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    private func commoninit(){
        addSubview(cardsCollection)
        cardsCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cardsCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardsCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardsCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
