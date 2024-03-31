//
//  AnasayfaViewModel.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var notRepo = NotDaoRepository()
    var notListesi = BehaviorSubject<[ToDoList]>(value: [ToDoList]())
    
    init() {
        veritabaniKopyala()
        notListesi = notRepo.notListesi
        notlariYukle()
    }
    
    func notlariYukle() {
        notRepo.notlariYukle()
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "toDoList", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoList.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {}
        }
    }
}
