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
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var slider: UISlider! //veri okumak için outlet
    @IBOutlet weak var labelStepper: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSlider.text = String(Int(slider.value)) // başlangıç değerini aktardık. sender yerine slider yazıldı çünkü o hem  outlet hem action olabilir.
        labelStepper.text = String(Int(stepper.value))
        indicator.isHidden = true
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
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value)) // anlık değişim için action
        
    }
    
    
    @IBAction func stepperDegisim(_ sender: UIStepper) {
        labelStepper.text = String(Int(sender.value))
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    @IBAction func buttonDur(_ sender: Any) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    @IBAction func buttonGoster(_ sender: Any) {
        
        print("Switch Son Durum: \(mySwitch.isOn)")
        
        let secilenIndeks = segmentedController.selectedSegmentIndex //sender yerine yukarıda outlet tanımladığımızı yazdık
        let secilenKategori = segmentedController.titleForSegment(at: secilenIndeks)
        
        print("Segmented Son Durum: \(secilenKategori!)")
        print("Slider Son Durum: \(slider.value)")
        print("Stepper Son Durum: \(stepper.value)")
    }
}

