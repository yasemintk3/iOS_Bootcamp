//
//  ViewController.swift
//  KullaniciEtkilesimi
//
//  Created by Yasemin TOK on 17.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            // tıklandıkttan sonra yapacağı işlemler
            print("İptal  Seçildi")
        }
        
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("Tamam Seçildi")
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
        
        
    }
    
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            // tıklandıkttan sonra yapacağı işlemler
            print("İptal  Seçildi")
        }
        
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("Tamam Seçildi")
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        alertController.addTextField { textField in //index 0
            textField.placeholder = "Veri Giriniz"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true //şifre
        }
        
        alertController.addTextField() // index 1
        
        let kaydetAction = UIAlertAction(title: "Kaydet", style: .cancel) { action in
            let tf = alertController.textFields![0] as UITextField // klavyeden girilen bilgi çevrilip tf ye eklendi, [0] demek ilk eklenen
            let tf1 = alertController.textFields![1] as UITextField // klavyeden girilen bilgi çevrilip tf ye eklendi, [1] demek ikinci eklenen
            
            if let alinanVeri = tf.text, let alinanVeri1 = tf1.text {
                print("Veri : \(alinanVeri) - \(alinanVeri1)")
            }
         
        }
        
        alertController.addAction(kaydetAction)
        
        self.present(alertController, animated: true)
    }
}

