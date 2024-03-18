//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Yasemin TOK on 17.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textFieldGirdi: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mySwitch: UISwitch! // hem outlet hem action olabilir
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonYap(_ sender: Any) {
        if let alinanVeri = textFieldGirdi.text {
            labelSonuc.text = alinanVeri
        }
    }
    
    @IBAction func buttonMutlu(_ sender: Any) {
        
        imageView.image = UIImage(named: "mutlu")
    }
    
    @IBAction func buttonUzgun(_ sender: Any) {
        
        imageView.image = UIImage(named: "uzgun")
    }
    
    @IBAction func switchDegisim(_ sender: UISwitch) { // switchin özelliklerini kullanmak için UISwitch seçtik
        if sender.isOn {
            print("Switch : ON")
        } else {
            print("Switch : OFF")
        }
    }
    
    @IBAction func segmentedDegisim(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndeks)
        
        print("Seçim: \(secilenKategori!)")
    }

    @IBAction func buttonGoster(_ sender: Any) {
        
        print("Switch Son Durum: \(mySwitch.isOn)")
        
        let secilenIndeks = segmentedController.selectedSegmentIndex //sender yerine yukarıda outlet tanımladığımızı yazdık
        let secilenKategori = segmentedController.titleForSegment(at: secilenIndeks)
        
        print("Segmented Son Durum: \(secilenKategori!)")
    }
}

