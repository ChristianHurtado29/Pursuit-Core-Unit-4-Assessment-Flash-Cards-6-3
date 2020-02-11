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

    private var queCards = [CardInfo]() {
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
        
        searchView.collectionView.delegate = self
       
    }
    

}

extension SearchViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let maxSize: CGSize = UIScreen.main.bounds.size
      let itemWidth: CGFloat = maxSize.width
      let itemHeight: CGFloat = maxSize.height * 0.20 // 30%
      return CGSize(width: itemWidth, height: itemHeight)
    }
}
