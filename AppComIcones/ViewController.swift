//
//  ViewController.swift
//  AppComIcones
//
//  Created by aluno on 15/03/21.
//  Copyright © 2021 AlunoTJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    
    @IBOutlet weak var btnGerarSenha: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfTotalPasswords.delegate = self
        self.tfNumberOfCharacters.delegate = self
    }
    
    @IBAction func checkList(_ sender: Any) {
        if(!swLetters.isOn && !swNumbers.isOn && !swSpecialCharacters.isOn && !swCaptitalLetters.isOn ){
            btnGerarSenha.isEnabled = false
        } else {
            btnGerarSenha.isEnabled = true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 2
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if(tfNumberOfCharacters.text == "" || tfTotalPasswords.text == "" ){
            let alert = UIAlertController(title: "Atencao!", message: "Adicione 'Quantidade de senhas' e 'Caracteres' que deseja", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                (action) in
                print("Ok")
            }))
            self.present(alert, animated: true)
        }
        
        if( Int(tfTotalPasswords.text!) ?? 0 <= 0 ){
            let alert = UIAlertController(title: "Atencao!", message: "Adicinone 'Quantidade de senhas' que deseja", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                (action) in
                print("Ok")
            }))
            self.present(alert, animated: true)
        }
        
        if( Int(tfNumberOfCharacters.text!) ?? 0 < 6 ){
            let alert = UIAlertController(title: "Atencao!", message: "Numero minimo de caracteres (6)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                (action) in
                print("Ok")
            }))
            self.present(alert, animated: true)
        }
        
        if( Int(tfNumberOfCharacters.text!) ?? 0 > 16 ){
             let alert = UIAlertController(title: "Atencao!", message: "Numero maximo de caracteres (16)", preferredStyle: .alert)
             
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                 (action) in
                 print("Ok")
             }))
             self.present(alert, animated: true)
         }
        
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

