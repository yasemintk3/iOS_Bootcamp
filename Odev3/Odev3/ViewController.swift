//
//  ViewController.swift
//  Odev3
//
//  Created by Yasemin TOK on 13.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Coffee"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "temaRenk")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,
                                          .font: UIFont(name: "Satisfy-Regular", size: 30)!]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

