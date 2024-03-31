//
//  NotDetayViewModel.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import Foundation

class NotDetayViewModel {
    
    var notRepo = NotDaoRepository()
    
    func guncelle(not_id:Int, not_name:String) {
        notRepo.guncelle(not_id: not_id, not_name: not_name)
    }
}
