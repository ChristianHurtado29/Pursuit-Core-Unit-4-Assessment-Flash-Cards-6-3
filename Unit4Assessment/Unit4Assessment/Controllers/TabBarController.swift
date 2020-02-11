//
//  ViewController.swift
//  Unit4Assessment
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TabBarController: UITabBarController {
    
    private var dataPersistence = DataPersistence<String>(filename: "flashCards.plist")

    
    private lazy var cardsVC: CardsViewController = {
      let viewController = CardsViewController()
      viewController.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "eyeglasses"), tag: 0)
      viewController.dataPersistence = dataPersistence
      
      // ADDITION: injecting userPreference into newsFeedVC
  //    viewController.userPreference = userPreference
      // ADDITION: setting the newsFeedVC as the delegate object for UserPreference (it will now listen for changes done in the SettingsViewController picker view on UserDefaults)
  //    viewController.userPreference.delegate = viewController
      return viewController
    }()
    
    private lazy var createVC: CreateViewController = {
        let viewController = CreateViewController()
        viewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "mic"), tag: 1)
        return viewController
    }()
    
    private lazy var searchVC: SearchViewController = {
        let viewController = SearchViewController()
        viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName:"mic"), tag: 2)
        return viewController
    }()
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    viewControllers = [UINavigationController(rootViewController: cardsVC),
                       UINavigationController(rootViewController: createVC), searchVC
    ]
    
  }


}

