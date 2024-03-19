//
//  ViewController.swift
//  Odev5Calculator
//
//  Created by Yasemin TOK on 18.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelHesap: UILabel!
    
    var hesapSonucu = 0
    var toplamButonunaBasildiMi = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelHesap.text = ""
        labelHesap.translatesAutoresizingMaskIntoConstraints = true
       
    }
    
    @IBAction func tiklananButton(_ sender: UIButton) {
        if toplamButonunaBasildiMi { // true ise
            
            toplamButonunaBasildiMi = false
        }
        
        if let varOlanDeger = labelHesap.text {
            if let tiklananSayi  = sender.titleLabel?.text {
                labelHesap.text = varOlanDeger + tiklananSayi
            }
        }
    }
    
    @IBAction func buttonToplama(_ sender: Any) {
        
        if !toplamButonunaBasildiMi { // false ise
            
            toplamButonunaBasildiMi = true
            
            if let varOlanDeger = labelHesap.text {
                labelHesap.text = varOlanDeger + "+"
            }
        }
    }
    
    @IBAction func buttonSonuc(_ sender: Any) {
        
        hesapSonucu = 0
        
        if let toplam = labelHesap.text {
            let toplamDizi = toplam.split(separator: "+")
            
            for i in toplamDizi {
                if let sayi = Int(i) {
                    hesapSonucu = hesapSonucu + sayi
                }
            }
        }
        
        labelHesap.text = String(hesapSonucu)
    }
    
    @IBAction func buttonTemizle(_ sender: Any) {
        
        labelHesap.text = ""
    }
   
}
