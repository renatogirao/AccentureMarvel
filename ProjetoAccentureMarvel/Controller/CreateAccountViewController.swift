//
//  CreateAccountViewController.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 16/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    
    
    var firebase : DatabaseReference! = Database.database().reference()
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var buttonCreateAccount: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    @IBAction func createAccount(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!, completion:  { (user, erro) in
            
            if erro == nil {
                print ("Sucesso ao cadastrar o usuário")
                self.performSegue(withIdentifier: "segueVoltarLogin", sender: self)
                
            } else {
                print ("Erro ao cadastrar o usuário: \(erro?.localizedDescription) ")
                let alert = UIAlertController(title: "Erro!", message: "Erro ao criar usuário, verifique os dados.", preferredStyle: .alert)
                let tryToCreateLoginAgain = UIAlertAction(title: "Ok", style: .default, handler: nil )
                alert.addAction(tryToCreateLoginAgain)
                self.present(alert, animated: true, completion: nil)
                
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonCreateAccount.layer.cornerRadius = 15
        buttonCreateAccount.layer.cornerRadius = 15
        
    }
    
}

