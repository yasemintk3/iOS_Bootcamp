//
//  ViewController.swift
//  KingfisherKullanimi
//
//  Created by Yasemin TOK on 3.04.2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resimGostter(resimAdi: "kofte.png")
    }

    @IBAction func buttonResim1(_ sender: Any) {
        
        resimGostter(resimAdi: "ayran.png")
    }
    
    @IBAction func buttonResim2(_ sender: Any) {
        
        resimGostter(resimAdi: "kahve.png")
    }
    
    func resimGostter(resimAdi:String) {
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.imageView.kf.setImage(with: url)
            }
        }
    }
}
