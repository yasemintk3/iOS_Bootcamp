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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelHesap.text = ""
        labelHesap.translatesAutoresizingMaskIntoConstraints = true
       
    }
    
    @IBAction func buttonDokuz(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "9"
        }
    }
    
    @IBAction func buttonSekiz(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "8"
        }
    }
    
    @IBAction func buttonYedi(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "7"
        }
    }
    
    @IBAction func buttonAlti(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "6"
        }
    }
    
    @IBAction func buttonBes(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "5"
        }
    }
    
    @IBAction func buttonDort(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "4"
        }
    }
    
    @IBAction func buttonUc(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "3"
        }
    }
    
    @IBAction func buttonIki(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "2"
        }
    }
    
    @IBAction func buttonBir(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "1"
        }
    }
    
    @IBAction func buttonSifir(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "0"
        }
    }
    
    @IBAction func buttonToplama(_ sender: Any) {
        
        if let varOlanDeger = labelHesap.text {
            labelHesap.text = varOlanDeger + "+"
        }
    }
    
    @IBAction func buttonSonuc(_ sender: Any) {
        
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
