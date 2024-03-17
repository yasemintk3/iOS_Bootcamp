//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Yasemin TOK on 16.03.2024.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var labelAnasayfa: UILabel!
    
    override func viewDidLoad() { // uygulama ilk açıldığında 1 kere çalışır.
        super.viewDidLoad()
        
        labelAnasayfa.text = "Hoş Geldin"
        
        print("viewDidLoad çalıştı.")
    }
    
    override func viewWillAppear(_ animated: Bool) { // sayfa her göründüğünde çalışır.
        print("viewWillAppear çalıştı.")
        //sayfaya geri dönüldüğünde çalışır.
    }
    
    override func viewWillDisappear(_ animated: Bool) { // sayfa her görünmez olduğunda çalışır.
        print("viewWillDisappear çalıştı.")
    }

    @IBAction func buttonYap(_ sender: Any) {
        labelAnasayfa.text = "Merhaba"
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        let kisi = Kisiler(ad: "Ada", yas: 25, boy: 1.68, bekar: true)
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //segue ile sayfalar arası geçiş yapıldığında prepare ile veri aktarımı yapılır.
        if segue.identifier == "oyunEkraninaGecis" {  // segue ile  geçiş yapılırken id si oyunEkraniGecis olan çalışırsa prepare fonksiyonu çalışacak
            
            if let veri = sender as? Kisiler { //sender geçişin tetiklendiği nesneyi temsil ediyor, eğer sender String olarak değişip veri ye aktarılabilirse bu  kısım çalışacak
                
                let gidilecekVC = segue.destination as! OyunEkraniVC // OyunEkraniVC'ye erişim sağlandı ve veriler gidilecekVC ye aktarıldı.
                gidilecekVC.kisi = veri // gelen veriler bu şekilde diğer sayfaya aktarıldı.
            }
            
        }
    }
    
    
    @IBAction func buttonAdd(_ sender: Any) {
        print("Add seçildi")
    }
    
    
    @IBAction func buttonSave(_ sender: Any) {
        print("Save seçildi")
    }
    
}

