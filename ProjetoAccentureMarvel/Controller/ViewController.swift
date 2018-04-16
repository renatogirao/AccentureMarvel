//
//  ViewController.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 14/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tfName.resignFirstResponder()
        let vc = segue.destination as! HeroesTableViewController
        vc.name = tfName.text
    }
    
}


