//
//  HeroTableViewCell.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 15/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var ivThumb : UIImageView!
    @IBOutlet weak var lbName : UILabel!
    @IBOutlet weak var lbDescription : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepareCell(with hero: Hero) {
        lbName.text = hero.name
        lbDescription.text = hero.description
        
        if let url =  URL(string: hero.thumbnail.url) {
            //ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
            print ("Conseguiu recuperar a imagem")
        } else {
            ivThumb.image = nil
            print("Erro ao recuperar a imagem")
        }
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height / 2
        ivThumb.layer.borderColor = UIColor.red.cgColor
        ivThumb.layer.borderWidth = 2
    }
}