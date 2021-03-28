//
//  ViewController.swift
//  AppComIcones
//
//  Created by aluno on 15/03/21.
//  Copyright © 2021 AlunoTJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let passwordsViewController = segue.destination as! PasswordsViewController

        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn

        view.endEditing(true)
    }


}

