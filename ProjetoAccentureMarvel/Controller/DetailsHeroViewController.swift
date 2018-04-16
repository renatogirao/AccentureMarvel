//
//  DetailsHeroViewController.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 16/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit

class DetailsHeroViewController: UIViewController {
    
    var hero : Hero!
    
    @IBOutlet weak var descriptionHero: UILabel!
    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var thumbnailHero: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let url =  URL(string: hero.thumbnail.url)
            thumbnailHero.kf.indicatorType = .activity
            thumbnailHero.kf.setImage(with: url)
            descriptionHero.text = hero.description
            nameHero.text = hero.name
        
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}

