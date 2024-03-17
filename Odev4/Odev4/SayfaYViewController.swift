//
//  SayfaYViewController.swift
//  Odev4
//
//  Created by Yasemin TOK on 17.03.2024.
//

import UIKit

class SayfaYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func buttonAnasayfayaDon(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
