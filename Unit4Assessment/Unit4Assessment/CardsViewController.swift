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
    
    private var flashCards = [Cards]() {
        didSet{
            self.cardsView.cardsCollection.reloadData()
        }
    }
    
    public var dataPersistence: DataPersistence<String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        getCards()
        cardsView.cardsCollection.dataSource = self
        cardsView.cardsCollection.delegate = self
        cardsView.cardsCollection.register(CardsCell.self, forCellWithReuseIdentifier: "cardsCell")
    }
    
    private func getCards(){
        CardsAPIClient.getCards { [weak self] (result) in
        switch result {
        case .failure(let appError):
            print("error: \(appError)")
        case .success(let cards):
            self?.flashCards = cards
    }
  }
}
}

extension CardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
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
