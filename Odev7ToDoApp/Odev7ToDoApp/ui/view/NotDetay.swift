//
//  NotDetay.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import UIKit

class NotDetay: UIViewController {
    
    @IBOutlet weak var tfNotName: UITextField!
    
    var not:ToDoList?
    var viewModel = NotDetayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not {
            tfNotName.text = n.not_name
        }
    }
    
    @IBAction func guncelleButton(_ sender: Any) {
        if let notAdi = tfNotName.text, let not = not {
            viewModel.guncelle(not_id: not.not_id!, not_name: notAdi)
        }
    }
}
