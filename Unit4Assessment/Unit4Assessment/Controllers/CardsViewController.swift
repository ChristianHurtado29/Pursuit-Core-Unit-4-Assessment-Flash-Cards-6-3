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
            if flashCards.isEmpty{
                cardsView.cardsCollection.backgroundView = EmptyView(title: "No flashcards!", message: "Please add flashcards")
            } else {
                cardsView.cardsCollection.backgroundView = nil
            }
        }
    }
    private let savedCardsPersistence = DataPersistence<Cards>(filename: "cards.plist")

    public var dataPersistence: DataPersistence<Cards>!
    
    private func loadCards(){
        do{
            flashCards = try savedCardsPersistence.loadItems()
        } catch {
            print("error: \(error)")
        }
    }
    
    override func loadView() {
        view = cardsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCards()
        cardsView.cardsCollection.delegate = self
        cardsView.cardsCollection.dataSource = self
        cardsView.cardsCollection.delegate = self
        cardsView.cardsCollection.register(CardsCell.self, forCellWithReuseIdentifier: "cardsCell")
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCards()
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
        
        let pickedCard = flashCards[indexPath.row]
        cell.delegate = self
        cell.backgroundColor = .purple
        cell.selCard = pickedCard
        cell.configureCell(for: pickedCard)
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

extension CardsViewController: CellDetDelegate {
    func didPressButton(cell: CardsCell, card: Cards) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.deleteCard(card: card)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true)
    }
    
    private func deleteCard(card: Cards) {
        guard let index = flashCards.firstIndex(of: card) else {
            loadCards()
            return
        }
        do{
            try dataPersistence.deleteItem(at: index)
            showAlert(title: "Deleted", message: "card was successfully deleted")
        }catch {
            showAlert(title: "Error", message: "card could not be deleted")
        }
    }
}

