//
//  CreateVC.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CreateViewController: UIViewController {
    
    private var createView = CreateView()
    public var dataPersistence = DataPersistence<Cards>(filename: "cards.plist")


    override func loadView() {
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create Quiz"
        navigationItem.rightBarButtonItem = .init(title: "Post", style: .plain, target: self, action: #selector(printTest))
        view.backgroundColor = .systemPink
    }
    
    func emptyTextFields(){
        let showAlert = UIAlertController(title: "Failed", message: "The quiz needs text in all text fields", preferredStyle: .alert)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(showAlert, animated: true, completion: nil)
    }
    
    @objc
    func printTest(){
        
        if createView.firstTextView.text.isEmpty || createView.secondTextView.text.isEmpty || createView.textField.text!.isEmpty{
        emptyTextFields()
        } else {
        let showAlert = UIAlertController(title: "Saved", message: "Question successfully added", preferredStyle: .alert)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(showAlert, animated: true, completion: nil)
        print("hola")
    }
    }
    

}
