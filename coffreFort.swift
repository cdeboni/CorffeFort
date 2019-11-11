//
//  coffreFort.swift
//  CorffreFort
//
//  Created by Christophe De Boni on 04/11/2019.
//  Copyright © 2019 Christophe De Boni. All rights reserved.
//

import Foundation


// initialisation de la grille
var grilleCoffre: [Int] = []

func generer_nombre_aleatoire(debut: Int, fin: Int) -> Int {
    var intRandom = Int.random(in: debut..<fin+1)

    if intRandom > fin {
        intRandom = fin
    }
    //print(intRandom)
    return intRandom
}

func Initialiser_CoffreFort() -> [Int] {
    var tab: [Int] = []
    for _ in 0..<6 {    // ligne
        for _ in 0..<6 {    // colonne
            tab.append(generer_nombre_aleatoire(debut: 0, fin: 9))
        }
    }
    
    tab = [2, 4 , 5, 3, 1, 6, 3, 6, 1, 4, 5, 2, 4, 3, 2, 5, 6, 1, 5, 1, 6, 2, 4, 3, 1, 2, 4, 6, 3, 5, 6, 5, 3, 1, 2, 4]
    return tab
}

func tag2case(tag:Int) -> [Int] {
    var ligne: Int = 0
    var colonne: Int = 0
    let tab: [Int]
    
    ligne   = tag / 6  // la valeur
    colonne = tag % 6 // le reste
    
    tab = [ligne, colonne]
    
    return tab
}

func choisir_case_destination(ligne: Int, colonne: Int) -> [Int] {
    var tab: [Int] = []
    
    if ligne < 3 {
        tab.append(generer_nombre_aleatoire(debut: 3, fin: 5))    // Valeur aléatoire de 3 à 5
    }
    else {
        tab.append(generer_nombre_aleatoire(debut: 0, fin: 2))    // Valeur aléatoire de 0 à 2
    }
    
    if colonne < 3 {
        tab.append(generer_nombre_aleatoire(debut: 3, fin: 5))    // Valeur aléatoire de 3 à 5
    }
    else {
        tab.append(generer_nombre_aleatoire(debut: 0, fin: 2))    // Valeur aléatoire de 0 à 2
    }
    
    print(tab)
    return tab
}

func lire_case(tab: [Int], ligne: Int, colonne: Int) -> Int {
    return tab[ligne * 6 + colonne]
}

func affiche_chemin(tab: [Int], ligne: Int, colonne: Int) -> [Int] {
    // Initialisation des variables
    var tabChemin: [Int] = []
    var tabCaseDestination: [Int] = []
    var ligneDestination: Int = 0
    var colonneDestination: Int = 0
    var ligneCourante: Int = ligne
    var colonneCourante: Int = colonne
    var direction: Int = 0
    var incrementH: Int = 0
    var incrementV: Int = 0

    // Valeur de la case choisie
    tabChemin.append(lire_case(tab: tab, ligne: ligne, colonne: colonne))
    // Initialisation de la case de destination
    tabCaseDestination  = choisir_case_destination(ligne: ligne, colonne: colonne)
    print("destination:\(tabCaseDestination)")
    ligneDestination    = tabCaseDestination[0]
    colonneDestination  = tabCaseDestination[1]
    // Initialisation de la direction du déplacement
    if ligne < 3 {
        incrementV = 1
    } else {
        incrementV = -1
    }
    if colonne < 3 {
        incrementH = 1
    } else {
        incrementH = -1
    }
    // boucle de lecture du chemin
    while ligneCourante != ligneDestination || colonneCourante != colonneDestination {
        print("ligneCourante=[\(ligneCourante)] colonneCourante=[\(colonneCourante)]")
        direction = 0
        if ligneCourante == ligneDestination {
            direction   = 2     // Déplacement vertical
            incrementV  = 0     // On ne peut plus se séplacer dans cette direction
        }
        if colonneCourante == colonneDestination {
            direction   = 1     // Déplacement horizontal
            incrementH  = 0     // On ne peut plus se séplacer dans cette direction
        }
        
        // Calcul de la direction si pas imposée
        if direction == 0 {
            direction = generer_nombre_aleatoire(debut: 1, fin: 2)      // Direction 1 (déplacement verticale) ou 2 (déplacement horizontal)
        }
        
        // Calcul de la case à lire
        if direction == 1 {
            ligneCourante += incrementV
        } else {
            colonneCourante += incrementH
        }
        
        // Valeur de la case choisie
        tabChemin.append(lire_case(tab: tab, ligne: ligneCourante, colonne: colonneCourante))
    }
    
    return tabChemin
}
