//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Yasemin TOK on 16.03.2024.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var labelAnasayfa: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelAnasayfa.text = "Hoş Geldin"
        
    }

    @IBAction func buttonYap(_ sender: Any) {
        labelAnasayfa.text = "Merhaba"
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
    }
    
}

