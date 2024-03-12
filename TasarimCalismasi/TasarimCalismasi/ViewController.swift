//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Yasemin TOK on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pizza"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "anaRenk")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,
                                          .font: UIFont(name: "Whisper-Regular", size: 25)!]
        navigationController?.navigationBar.barStyle = .black //temam koyu saati ve diğerlerini açık yap
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
    }


}

