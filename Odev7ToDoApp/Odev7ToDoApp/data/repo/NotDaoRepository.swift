//
//  NotDaoRepository.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import Foundation
import RxSwift

class NotDaoRepository {
    
    var notListesi = BehaviorSubject<[ToDoList]>(value: [ToDoList]())
    
    let db:FMDatabase?
    
    init() {
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoList.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
// MARK: Funcs
    
    func kaydet(not_name:String) {
        
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO toDos (not_name) VALUES (?)", values: [not_name])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(not_id:Int, not_name:String) {
        
        db?.open()
        do {
            try db!.executeUpdate("UPDATE toDos SET not_name = ? WHERE not_id = ?", values: [not_name, not_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(not_id:Int) {
        
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM toDos WHERE not_id = ?", values: [not_id])
            notlariYukle()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi:String) {
        db?.open()
        
        var liste = [ToDoList]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE not_name like '%\(aramaKelimesi)%'", values: nil)
            
            while result.next(){
                let not = ToDoList(not_id: Int(result.string(forColumn: "not_id"))!,
                                   not_name: result.string(forColumn: "not_name")!)
                liste.append(not)
            }
            notListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func notlariYukle() {
        
        db?.open()
        
        var liste = [ToDoList]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while result.next(){
                let not = ToDoList(not_id: Int(result.string(forColumn: "not_id"))!,
                                   not_name: result.string(forColumn: "not_name")!)
                liste.append(not)
            }
            notListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
