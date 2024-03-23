//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation

class AnasayfaViewModel {
    
    var sonuc = "0"
    
    func toplamaYap(alinanSayi1:String, alinanSayi2:String) {
        if let sayi1 = Int(alinanSayi1) , let sayi2 = Int(alinanSayi2) { //Anasayfa'dan button tıklamasından alınan değerleri kullandık
            let toplam = sayi1 + sayi2
            sonuc = String(toplam) //sonuc Anasayfa'ya gönderildi.
        }
    }
    
    func carpmaYap(alinanSayi1:String, alinanSayi2:String) {
        if let sayi1 = Int(alinanSayi1) , let sayi2 = Int(alinanSayi2) {
            let carpma = sayi1 * sayi2
            sonuc = String(carpma)
        }
    }
}
