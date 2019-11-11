//
//  ViewController.swift
//  CorffreFort
//
//  Created by Christophe De Boni on 02/11/2019.
//  Copyright © 2019 Christophe De Boni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var grilles: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grilleCoffre = Initialiser_CoffreFort()
         for index in 0..<grilles.count {
            grilles[index].setTitle(String(grilleCoffre[index]), for: .normal)
            grilles[index].layer.cornerRadius = grilles[index].frame.width / 2
        }
    }

    @IBAction func grillesPressed(_ sender: UIButton) {
        let ligne: Int
        let colonne: Int

        ligne   = tag2case(tag: sender.tag)[0]
        colonne = tag2case(tag: sender.tag)[1]
        print("Chemin:\(affiche_chemin(tab: grilleCoffre, ligne: ligne, colonne: colonne))")
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return mobileBrand.count
        //return tabGrille.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return mobileBrand[section].modelName?.count ?? 0
        return grilleCoffre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var str: String = ""
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = mobileBrand[indexPath.section].modelName?[indexPath.row]
        for i in 0..<grilles.count {
             str = str + String(grilleCoffre[i]) + " "
        }
        cell.textLabel?.text = str
        return cell
    }
}
