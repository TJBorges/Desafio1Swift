//
//  SecurityTipsViewController.swift
//  AppComIcones
//
//  Created by aluno on 16/03/21.
//  Copyright © 2021 AlunoTJ. All rights reserved.
//

import UIKit

class SecurityTipsViewController: UIViewController {
    
    @IBOutlet weak var tvDicas: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        
        if let filePath = Bundle.main.path(forResource: "DicasSenha", ofType: "txt") {
            let contents = try? String(contentsOfFile: filePath)
            tvDicas.text = contents
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
