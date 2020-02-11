//
//  CreateVC.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    private var createView = CreateView()

    override func loadView() {
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = .init(title: "Post", style: .plain, target: self, action: #selector(printTest))
        view.backgroundColor = .systemPink

    }
    
    @objc
    func printTest(){
        print("hola")
    }
    

}
