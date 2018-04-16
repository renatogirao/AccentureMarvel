//
//  HeroesTableViewController.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 14/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    var name: String?
    var heroes: [Hero] = []
    
    var label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando os heróis, aguarde por favor..."
        loadHeroes()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroViewController
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }
    
    func loadHeroes() {
        loadingHeroes = true
        APIMarvel.loadHeroes(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                print ("O Total é:", self.total, "Quantos heróis já inclusos", self.heroes.count)
                
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.label.text = "Não foram encontrados heróis com o nome \(self.name!)"
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)
        
        
        return cell
    }
}

