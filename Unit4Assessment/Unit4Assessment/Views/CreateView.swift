//
//  CreateView.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CreateView: UIView {

    public lazy var textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "enter quiz name"
        return tf
    }()
    
    public lazy var firstTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter flashcard title:"
        return label
    }()
    
    public lazy var firstTextView: UITextView = {
        let tv = UITextView()
        tv.text = ""
        return tv
    }()
    
    public lazy var secondTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter flashcard answer:"
        return label
    }()
    
    public lazy var secondTextView: UITextView = {
        let tv = UITextView()
        tv.text = ""
        return tv
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        constrainTextField()
        constrainFirstLabel()
        constrainFirstTextView()
        constrainSecondLabel()
        constrainSecondTextView()
    }
    
    private func constrainTextField(){
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 100),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func constrainFirstLabel(){
        addSubview(firstTextLabel)
        firstTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            firstTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func constrainFirstTextView(){
        addSubview(firstTextView)
        firstTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextView.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 10),
            firstTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            firstTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func constrainSecondLabel(){
        addSubview(secondTextLabel)
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextLabel.topAnchor.constraint(equalTo: firstTextView.bottomAnchor, constant: 10),
            secondTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func constrainSecondTextView(){
        addSubview(secondTextView)
        secondTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextView.topAnchor.constraint(equalTo: secondTextLabel.bottomAnchor, constant: 10),
            secondTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            secondTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

}
