//
//  DaoRepository.swift
//  Odev6ListingInterface
//
//  Created by Yasemin TOK on 25.03.2024.
//

import Foundation
import RxSwift

class DaoRepository {
    
    var tatlilarListesi = BehaviorSubject<[Tatlilar]>(value: [Tatlilar]())
    
    func tatlilariYukle() {
        
        var liste = [Tatlilar]()
        
        let t1 = Tatlilar(id: 1, ad: "Waffle", resim: "waffle", fiyat: 180)
        let t2 = Tatlilar(id: 2, ad: "Çilek ve Çikolata Aşkı", resim: "cilekvecikolata", fiyat: 380)
        let t3 = Tatlilar(id: 3, ad: "Elmalı Turta Dilimi", resim: "elmali", fiyat: 400)
        let t4 = Tatlilar(id: 4, ad: "Dondurma", resim: "dondurma", fiyat: 375)
        let t5 = Tatlilar(id: 5, ad: "Çikolatalı Pasta Dilimi", resim: "cikolataliKek", fiyat: 145)
        let t6 = Tatlilar(id: 6, ad: "Limon ve Lavanta Dansı", resim: "limonlu", fiyat: 550)
        liste.append(t1)
        liste.append(t2)
        liste.append(t3)
        liste.append(t4)
        liste.append(t5)
        liste.append(t6)
        
        tatlilarListesi.onNext(liste)
    }
}
