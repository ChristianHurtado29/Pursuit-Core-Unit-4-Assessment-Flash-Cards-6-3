//
//  CardsView.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

protocol SaveCardsDel: AnyObject {
    func didCreateCard(card: Cards)
}

class CardsView: UIView {
    
    weak var delegate: SaveCardsDel?  // might be wrong
    
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
        setupCardsCollectionView()
    }
    
    private func setupCardsCollectionView(){
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
