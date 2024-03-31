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
        
        let color = UIColor(named: "button")
        
        tfNotName.layer.borderColor = color?.cgColor
        tfNotName.layer.borderWidth = 1.0
    }
    
    @IBAction func kaydetButton(_ sender: Any) {
        if let notAdi = tfNotName.text {
            viewModel.kaydet(not_name: notAdi)
        }
        tfNotName.text = ""
    }
}
