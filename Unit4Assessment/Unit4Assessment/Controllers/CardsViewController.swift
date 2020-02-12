//
//  InitialVC.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CardsViewController: UIViewController {
    
    private let cardsView = CardsView()
    public var dataPersistence = DataPersistence<Cards>(filename: "cards.plist")

    
    private var flashCards = [Cards]() {
        didSet{
            self.cardsView.cardsCollection.reloadData()
            if flashCards.isEmpty{
                cardsView.cardsCollection.backgroundView = EmptyView(title: "View is empty", message: "Please add flashcards")
            }
        }
    }
    
    override func loadView() {
        view = cardsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsView.cardsCollection.dataSource = self
        cardsView.cardsCollection.delegate = self
        cardsView.cardsCollection.register(SearchCell.self, forCellWithReuseIdentifier: "searchCell")
        view.backgroundColor = .white
    }
    
}

extension CardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return flashCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardsCell", for: indexPath) as? CardsCell else {
            fatalError("could not downcast")
        }
        
        let cards = flashCards[indexPath.row]
        return cell
    }
    
    
}

extension CardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let maxSize: CGSize = UIScreen.main.bounds.size
      let itemWidth: CGFloat = maxSize.width
      let itemHeight: CGFloat = maxSize.height * 0.20 // 30%
      return CGSize(width: itemWidth, height: itemHeight)
    }
    
   
}
