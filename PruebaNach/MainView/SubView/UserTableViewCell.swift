//
//  UserTableViewCell.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit

class UserTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    lazy var userTextField : UITextField =  {
        let textFiel = UITextField()
        textFiel.placeholder = "Nombre"
        textFiel.textAlignment = .center
        textFiel.textColor = .black
        textFiel.delegate = self
        textFiel.keyboardType = .asciiCapable
        textFiel.layer.cornerRadius = 5
        textFiel.layer.borderWidth = 1
        textFiel.layer.borderColor = UIColor.black.cgColor
        return textFiel
    }()

    init(){
        super.init(style: .default, reuseIdentifier: nil)
        initUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI(){
      
        self.contentView.backgroundColor = .white
        self.addSubview(userTextField)
        userTextField.addAnchorsAndSize(width: nil, height: 30, left: 50, top: 30, right: 50, bottom: nil)
      
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    {
        let numberOnly = NSCharacterSet.init(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
        let stringFromTextField = NSCharacterSet.init(charactersIn: string)
        let strValid = numberOnly.isSuperset(of: stringFromTextField as CharacterSet)

         return strValid
     }
  
}
