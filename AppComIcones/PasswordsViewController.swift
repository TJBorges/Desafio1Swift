//
//  PasswordsViewController.swift
//  AppComIcones
//
//  Created by aluno on 16/03/21.
//  Copyright © 2021 AlunoTJ. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters = 10 // default se usuario nao enviar
    var numberOfPasswords = 1
    var useLetters = false
    var useNumbers = false
    var useCapitalLetters = false
    var useSpecialCharacters = false
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordGenerator = PasswordGenerator(
            numberOfCharacters: numberOfCharacters,
            useLetters: useLetters,
            useNumbers: useNumbers,
            useCapitalLetters: useCapitalLetters,
            useSpecialLetters: useSpecialCharacters)
        
        if(tvPasswords.text == "" && numberOfPasswords != 0 ){
            setPasswords()
        }
    
    }
    
    @IBAction func gerarSenha(_ sender: Any) {
    tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // posiciona a scroll no topo da view
        tvPasswords.text = "" // limpa a view
                
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
             tvPasswords.text.append(password + "\n\n")
        }
    }
    
    func setPasswords(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // posiciona a scroll no topo da view
          tvPasswords.text = "" // limpa a view

          let passwords = passwordGenerator.generate(total: numberOfPasswords)
          for password in passwords {
               tvPasswords.text.append(password + "\n\n")
          }
      }
    
    

}
