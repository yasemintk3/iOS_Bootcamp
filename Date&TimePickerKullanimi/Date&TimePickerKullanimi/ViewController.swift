//
//  ViewController.swift
//  Date&TimePickerKullanimi
//
//  Created by Yasemin TOK on 22.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfSaat: UITextField!
    @IBOutlet weak var tfTarih: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        if #available(iOS 13.4, *) { // versiyon değişikliği
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
    }
    
    @objc func dokunmaAlgilamaMetod() {
        view.endEditing(true) // sayfa üzerinde açılmış yapıları kapatmak için kullanılır.
    }
    
    @objc func tarihGoster(uiDatePicker:UIDatePicker) {
        let format = DateFormatter() //değerleri nasıl almak istediğimi belirtmek için format belirlememi sağlıyor. mesela gün ay yıl şeklinde aldık.
        format.dateFormat = "dd.MM.yy"
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster(uiDatePicker:UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }
}

