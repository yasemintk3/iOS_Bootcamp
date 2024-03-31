//
//  NotKayit.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import UIKit

class NotKayit: UIViewController {

    @IBOutlet weak var tfNotName: UITextField!
    
    var viewModel = NotKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func kaydetButton(_ sender: Any) {
        if let notAdi = tfNotName.text {
            viewModel.kaydet(not_name: notAdi)
        }
        tfNotName.text = ""
    }
}
