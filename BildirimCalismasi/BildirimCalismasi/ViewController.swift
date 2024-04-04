//
//  ViewController.swift
//  BildirimCalismasi
//
//  Created by Yasemin TOK on 4.04.2024.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        
        //daha önce izin verilmediyse bu yapı çalışacak
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in // granted kullanıcı bildirim izninin onaylanıp onaylanmadığını verecek
            
            self.izinKontrol = granted // iznin durumunu kendi nesnemize aktardık
            
            if self.izinKontrol {
                print("İzin alma işlemi başarılı")
            } else {
                print("İzin alma işlemi başarısız")
            }
        }
    }

    @IBAction func buttonBildirimOlustur(_ sender: Any) {
        
        if izinKontrol { //true ise çalışacak
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "Mesaj"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            //let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false) 10 saniye sonra bildirim gitsin ve tekrar gitmesin
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true) // tekrarlı, en az 60 sn oluyor
            
            let bildirimIstek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner, .sound, .badge]) //.banner ile uygulama açık haldeykende bildirim gelecek
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) { //bildirime tıklanma durumu
        
        let app = UIApplication.shared //uygulamaya eriştik
        app.applicationIconBadgeNumber = 0 // bildirim seçildiğinde badge değeri 0 olacak
        
        if app.applicationState == .active { //uygulama açıkken bildirim seçildi
            print("Önplan : Bildirim seçildi")
        }
        
        if app.applicationState == .inactive {
            print("Arkaplan : Bildirim seçildi")
        }
        
        completionHandler()
    }
}
