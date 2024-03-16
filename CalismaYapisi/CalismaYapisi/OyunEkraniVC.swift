//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Yasemin TOK on 16.03.2024.
//

import UIKit

class OyunEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGeri(_ sender: Any) {
        navigationController?.popViewController(animated: true) //bir öneceki sayfaya dönüş
        //navigationController?.popToRootViewController(animated: true) //anasayfaya dönüş
    }
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    
}
