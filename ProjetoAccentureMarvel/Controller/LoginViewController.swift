//
//  LoginViewController.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 16/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var buttonCreateAccount: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBAction func signIn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Erro!", message: "Erro ao logar usuário, verifique os dados.", preferredStyle: .alert)
        let tryLoginAgain = UIAlertAction(title: "Ok", style: .default, handler: nil )
        alert.addAction(tryLoginAgain)
        
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { (usuario, erro) in
            
            if erro == nil {
                print ("Sucesso ao logar usuário.")
                self.performSegue(withIdentifier: "segueEntrouComLogin", sender: self)
            } else {
                print ("Erro ao logar usuário: \(erro?.localizedDescription)")
                
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLogin.layer.cornerRadius = 15
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        buttonCreateAccount.layer.cornerRadius = 15
       
        
    }
    
}

