//
//  MatematikRepository.swift
//  MVVMKullanimi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift

class MatematikRepository {
    
    var sonuc = BehaviorSubject<String>(value: "0")
    
    func toplamaYap(alinanSayi1:String, alinanSayi2:String) {
        if let sayi1 = Int(alinanSayi1) , let sayi2 = Int(alinanSayi2) { //Anasayfa'dan button tıklamasından alınan değerleri kullandık
            let toplam = sayi1 + sayi2
            sonuc.onNext(String(toplam))  //sonuc ViewModel'a gönderildi. //tetikleme
        }
    }
    
    func carpmaYap(alinanSayi1:String, alinanSayi2:String) {
        if let sayi1 = Int(alinanSayi1) , let sayi2 = Int(alinanSayi2) {
            let carpma = sayi1 * sayi2
            sonuc.onNext(String(carpma)) //tetikleme
        }
    }
}
