//
//  SearchVC.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchViewController: UIViewController {
    
    private var searchView = SearchView()
    
    //  public var dataPersistence = DataPersistence<CardInfo>()
    
    private var queCards = [Cards]() {
        didSet{
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
            }
        }
    }
    
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.collectionView.dataSource = self
        searchView.collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "searchCell")
        searchView.collectionView.delegate = self
         getCards()
    }
    
    private func getCards(){
        do{
            try
        queCards = JSONData.getCardsLocally()
        } catch{
            print(error)
        }
    }
    
    
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        queCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchView.collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCell else {
            fatalError("could not cast to cell")
        }
        let card = queCards[indexPath.row]
        cell.configureCell(for: card)
        cell.backgroundColor = .gray
        return cell
    }
    
    
}
extension SearchViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let maxSize: CGSize = UIScreen.main.bounds.size
    let spacingBetweenItems: CGFloat = 10
    let numberOfItems: CGFloat = 1
    let itemHeight:CGFloat = maxSize.height * 0.30
    let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1 ) * spacingBetweenItems
    let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
    return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
